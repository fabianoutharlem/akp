class Faq < ActiveRecord::Base

  validates_presence_of :answer
  validates_presence_of :question

end
