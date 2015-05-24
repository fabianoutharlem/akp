module Admin
  class MenuItemsController < AdminBaseController

    def index
      @menu_items = MenuItem.all
    end

    def create
      if MenuItem.create(menu_item_params)
        flash[:notice] = ['The menu item has been created succesfully']
      else
        flash[:error] = ['Something went wrong, nothing was created, please try again.']
      end
      redirect_to admin_menu_items_path
    end

    def new
      @pages = (Page.all + BlogPage.all).map do |page|
        [
            page.title,
            page.is_a?(BlogPage) ? blog_page_path(page) : page_path(page)
        ]
      end
    end

    def update_all
      begin
        menu_items = MenuItem.find(params[:menu_items].keys)
        menu_items.each do |menu_item|
          menu_item.label = params[:menu_items][menu_item.id.to_s]['label']
          menu_item.position = params[:menu_items][menu_item.id.to_s]['position']
          menu_item.last = params[:menu_items][menu_item.id.to_s]['last']
          menu_item.save!
          unless menu_item.valid?
            flash[:error] = [] if flash[:error].nil?
            flash[:error] << 'The menu_item with label ' + menu_item.label + 'was not updated'
          end
        end
      rescue
        flash[:error] = ['Something went wrong, nothing was updated, please try again.']
      end

      if flash[:error].blank?
        flash[:notice] = ['The menu items were all updated succesfully']
      end

      redirect_to admin_menu_items_path
    end

    private

    def menu_item_params
      params.require(:menu_item).permit(:id, :label, :path, :last)
    end

  end
end
