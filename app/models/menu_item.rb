class MenuItem < ActiveRecord::Base

  belongs_to :menu

  has_ancestry

end
