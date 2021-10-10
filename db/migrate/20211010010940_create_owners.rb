class CreateOwners < ActiveRecord::Migration[6.1]
  def change
    create_table :owners do |t|
      t.string :name, null: false
      t.string :business_email, null: false

      t.timestamps
    end
  end
end
