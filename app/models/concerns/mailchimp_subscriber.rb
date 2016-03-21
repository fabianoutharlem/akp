module MailchimpSubscriber # currently only for finance requests
  extend ::ActiveSupport::Concern

  included do
    after_create :subscribe_to_newsletter

    def subscribe_to_newsletter
      self.class.subscribe_to_newsletter(self.email) if self.newsletter_subscribe?
    end

    def self.subscribe_to_newsletter(email)
        begin
          mailchimp = Mailchimp::API.new('c240d93b2ebba837b5d284d222aefb98-us10')
          mailchimp.lists.subscribe('d1c5dbaed3', {email: email}, nil, 'html', false)
          Rails.logger.info "#{email} has been subscribed to the finance list"
        rescue Exception => e
          Rails.logger.debug e.message
        end
    end
  end


end