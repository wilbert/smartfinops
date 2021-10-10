class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.boolean :is_active
      t.integer :critical_level
      t.datetime :end_of_life
      t.string :business_alias
      t.string :code_repository_url
      t.integer :status
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
