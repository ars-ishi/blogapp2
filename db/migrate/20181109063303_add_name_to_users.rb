class AddNameToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :role, :integer, default: 1
    add_column :users, :name, :string, index: true
    add_column :users, :introduction, :string
    add_column :users, :ic_image, :string
    add_column :users, :bg_image, :string
  end

  def down
    remove_column :users, :role, :integer
    remove_column :users, :name, :string
    remove_column :users, :introduction, :string
    remove_column :users, :ic_image, :string
    remove_column :users, :bg_image, :string
  end
end
