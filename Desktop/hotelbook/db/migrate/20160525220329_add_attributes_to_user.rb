class AddAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :nom, :string
    add_column :users, :ville, :string
    add_column :users, :siteweb, :string
    add_column :users, :facebook, :string
    add_column :users, :admin, :boolean
  end
end
