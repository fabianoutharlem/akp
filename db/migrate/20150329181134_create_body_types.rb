class CreateBodyTypes < ActiveRecord::Migration
  def change
    create_table :body_types do |t|
      t.string :name
      t.string :icon

      t.timestamps
    end
  end
end
