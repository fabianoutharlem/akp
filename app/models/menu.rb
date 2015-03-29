class Menu < ActiveRecord::Base

  has_many :menu_items

  enum location: [:nowhere, :header, :footer]

end
