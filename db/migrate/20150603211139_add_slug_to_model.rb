class AddSlugToModel < ActiveRecord::Migration
  def change
    add_column :models, :slug, :string
    add_index :models, :slug, unique: true
  end
end
