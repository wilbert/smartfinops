class AddUrlsToCloudStacks < ActiveRecord::Migration[6.1]
  def change
    add_column :cloud_stacks, :domain_url, :string
  end
end
