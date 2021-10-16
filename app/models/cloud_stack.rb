require 'aws-sdk'

class CloudStack < ApplicationRecord
  belongs_to :app

  enum providers: { amazon: 0, google: 1 }
  enum status: { critical_alerts: 0, low_alerts: 1, healthy: 2 }

  has_many :cloud_stack_compliances
  has_many :compliances, through: :cloud_stack_compliances

  accepts_nested_attributes_for :compliances

  def host_platform

  end

  def last_month_cost
    client = Aws::CostExplorer::Client.new
    resp = client.get_cost_and_usage(
      time_period: {
        start: '2021-09-01',
        end: '2021-09-30'
      },
      filter: {
        tags: {
          key: 'APP',
          values: ['fin'],
          match_options: ["EQUALS"]
        }
      },
      granularity: "MONTHLY",
      metrics: ['UsageQuantity']
    )
    resp.results_by_time[0].total
  end

end
