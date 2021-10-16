class CreateCloudStackcompliances < ActiveRecord::Migration[6.1]
  def change
    create_table :cloud_stack_compliances do |t|
      t.references :cloud_stack, null: false, foreign_key: true
      t.references :compliance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
