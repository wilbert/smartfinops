class CreateCompliences < ActiveRecord::Migration[6.1]
  def change
    create_table :compliences do |t|
      t.string :rule_name
      t.float :weight
      t.datetime :deadline
      t.boolean :required_by_law

      t.timestamps
    end
  end
end
