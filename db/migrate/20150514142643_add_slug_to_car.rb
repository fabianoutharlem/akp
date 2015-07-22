class AddSlugToCar < ActiveRecord::Migration
  def change
    add_column :cars, :slug, :string, after: :id
    add_index :cars, :slug, unique: true
  end
end
