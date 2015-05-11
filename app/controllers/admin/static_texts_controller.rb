module Admin
  class StaticTextsController < AdminBaseController

    def index
      @static_texts = StaticText.all
    end

    def update_multiple

      begin
        static_texts = StaticText.find(params[:static_texts].keys)
        static_texts.each do |static_text|
          # static_text.value = params[:static_texts][static_text.id][:value]
          # static_text.save!
          puts params[:static_texts][static_text.id]
        end
      end

      redirect_to admin_static_texts_path
    end

  end
end