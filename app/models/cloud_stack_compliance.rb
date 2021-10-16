class CloudStackCompliance < ApplicationRecord
  belongs_to :cloud_stack
  belongs_to :compliance
end
