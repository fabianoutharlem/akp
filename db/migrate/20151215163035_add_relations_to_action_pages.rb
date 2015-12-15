class AddRelationsToActionPages < ActiveRecord::Migration
  def change
    add_reference :action_pages, :brand, before: :active
    add_reference :action_pages, :model, before: :active
  end
end
