class AddFieldsToReference < ActiveRecord::Migration
  def change
    add_column :references, :title, :string
    add_column :references, :email, :string
  end
end
