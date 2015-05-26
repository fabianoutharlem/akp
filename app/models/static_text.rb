class StaticText < ActiveRecord::Base

  serialize :value

  class << self
    attr_accessor :__cache
    attr_accessor :__cache_expires_in
  end

  def self.method_missing(method, *args)
    @__cache = ActiveSupport::Cache::MemCacheStore.new if @__cache.nil?
    @__cache_expires_in = 1.minute if @__cache_expires_in.nil?

    method = method.to_s

    if @__cache.read(method).nil?
      static_text = self.where(key: method).first
      if static_text.present?
        @__cache.write(method, static_text.value, expires_in: @__cache_expires_in)
        return static_text.value
      else
        self.create(key: method, value: method)
        @__cache.write(method, nil)
        return method
      end
    else
      return @__cache.read(method)
    end
  end

end
