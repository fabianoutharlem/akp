class MenuItem < ActiveRecord::Base
  acts_as_list

  default_scope { order(position: :asc) }

end
