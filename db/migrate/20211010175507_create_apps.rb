class CreateApps < ActiveRecord::Migration[6.1]
  def change
    create_table :apps do |t|
      t.string :name
      t.boolean :is_active
      t.integer :critical_level
      t.boolean :is_internal
      t.string :business_alias
      t.string :repository_url
      t.string :app_tags
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
    add_index :apps, :app_tags
  end
end
