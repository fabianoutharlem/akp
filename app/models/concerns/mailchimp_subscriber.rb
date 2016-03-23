module MailchimpSubscriber # currently only for finance requests
  extend ::ActiveSupport::Concern

  included do

    LISTS = {
        private: '542565ccc6',
        financial: 'dda669b93e',
        '50_50' => 'e6ec617236'
    }.freeze

    after_create :subscribe_to_newsletter

    def subscribe_to_newsletter
      self.class.subscribe_to_newsletter(self.email, LISTS[self.request_type.to_sym] || 'd1c5dbaed3') if self.newsletter_subscribe?
    end

    def self.subscribe_to_newsletter(email, list_id)
        begin
          mailchimp = Mailchimp::API.new('c240d93b2ebba837b5d284d222aefb98-us10')
          mailchimp.lists.subscribe(list_id, {email: email}, nil, 'html', false)
          Rails.logger.info "#{email} has been subscribed to the finance list"
        rescue Exception => e
          Rails.logger.debug e.message
        end
    end
  end


end