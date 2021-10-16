class CreateCloudResources < ActiveRecord::Migration[6.1]
  def change
    create_table :cloud_resources do |t|
      t.string :identifier
      t.string :service
      t.string :name
      t.string :service_type
      t.string :region
      t.string :correct_app_tag
      t.string :app_env
      t.references :cloud_stack, null: false, foreign_key: true

      t.timestamps
    end
  end
end
