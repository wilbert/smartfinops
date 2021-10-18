class AddRemainingCloudResourcesFields < ActiveRecord::Migration[6.1]
  def change
    add_column :cloud_resources, :tag_compliant, :boolean
    add_column :cloud_resources, :deleted_at, :datetime
    add_column :cloud_resources, :created_by, :string
  end
end
