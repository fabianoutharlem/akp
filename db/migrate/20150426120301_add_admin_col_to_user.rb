class AddAdminColToUser < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, after: :email
  end
end
