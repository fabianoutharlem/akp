class Reference < ActiveRecord::Base

  default_scope { order(created_at: :desc) }

  def self.avarage(collection)
    collection.pluck(:rating).instance_eval { reduce(:+) / size.to_f }.round(1) if collection.any?
  end

end
