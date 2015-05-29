class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :name
      t.string :content
      t.integer :rating
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end
