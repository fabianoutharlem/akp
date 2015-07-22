class AddSlugToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :slug, :string, after: :id
    add_index :brands, :slug, unique: true
  end
end
