class AddTagsFieldToCloudResources < ActiveRecord::Migration[6.1]
  def change
    add_column :cloud_resources, :tags, :jsonb
  end
end
