class AddNameToCloudStack < ActiveRecord::Migration[6.1]
  def change
    add_column :cloud_stacks, :name, :string
    add_index :cloud_stacks, :name
  end
end
