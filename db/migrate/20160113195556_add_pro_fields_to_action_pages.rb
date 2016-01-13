class AddProFieldsToActionPages < ActiveRecord::Migration
  def change
    add_column :action_pages, :pro_1, :string
    add_column :action_pages, :pro_2, :string
    add_column :action_pages, :pro_3, :string
    add_column :action_pages, :pro_4, :string
    add_column :action_pages, :pro_5, :string
    add_column :action_pages, :pro_6, :string
    add_column :action_pages, :pro_7, :string
  end

  ActionPage.update_all(
                pro_1: 'Groot aanbod',
                pro_2: 'Onderhoudshistorie & schadeverleden bekend',
                pro_3: 'Standaard 3 maanden garantie',
                pro_4: 'Goed onderhouden',
                pro_5: 'Gunstige aanschafprijs',
                pro_6: 'Van de 1e eigenaar',
                pro_7: 'Mogelijkheid om uw auto te financieren',
  )

end
