module Admin
  class StaticTextsController < AdminBaseController

    def index
      @static_texts = StaticText.all.order(key: :asc)
    end

    def update_multiple
      begin
        static_texts = StaticText.find(params[:static_texts].keys)
        static_texts.each do |static_text|
          static_text.value = params[:static_texts][static_text.id.to_s]['value']
          static_text.save!
          unless static_text.valid?
            flash[:error] = [] if flash[:error].nil?
            flash[:error] << 'The text with key ' + static_text.key + 'was not updated'
          end
        end
      rescue
        flash[:error] = ['Something went wrong, nothing was updated, please try again.']
      end

      if flash[:error].blank?
        Dalli::Client.new.flush
        flash[:notice] = ['The static texts were all updated succesfully']
      end
      redirect_to admin_static_texts_path
    end

  end
end