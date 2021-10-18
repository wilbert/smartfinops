class CreateCloudResources < ActiveRecord::Migration[6.1]
  def change
    create_table :cloud_resources do |t|
      t.string :resource_name
      t.string :resource_id
      t.string :resource_type
      t.string :resource_creation_time
      t.integer :cloud_provider
      t.string :cloud_provider_id
      t.string :aws_arn
      t.jsonb :relationships

      t.timestamps
    end
  end
end
