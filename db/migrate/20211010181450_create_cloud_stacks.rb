class CreateCloudStacks < ActiveRecord::Migration[6.1]
  def change
    create_table :cloud_stacks do |t|
      t.integer :cloud_provider
      t.string :cloud_provider_id
      t.float :sla
      t.float :score
      t.integer :status
      t.references :app, null: false, foreign_key: true

      t.timestamps
    end
  end
end
