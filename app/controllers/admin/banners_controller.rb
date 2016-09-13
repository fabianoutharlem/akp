class Admin::BannersController < Admin::AdminBaseController
  before_action :set_banner, only: [:show, :edit, :update, :destroy]

  # GET /banners
  def index
    @banners = Banner.all
  end

  # GET /banners/1
  def show
  end

  # GET /banners/new
  def new
    @banner = Banner.new
  end

  # GET /banners/1/edit
  def edit
  end

  # POST /banners
  def create
    @banner = Banner.new(banner_params)

    if @banner.save
      redirect_to admin_banners_path, notice: 'Banner was successfully created.'
    else
      flash[:error] = @banner.errors.full_messages
      render :new
    end
  end

  def update_row_order
    @banner = Banner.find(banner_params[:banner_id])
    @banner.row_order_position = banner_params[:row_order_position]
    @banner.save

    render nothing: true, status: 200 # this is a POST action, updates sent via AJAX, no view rendered
  end

  # PATCH/PUT /banners/1
  def update
    if @banner.update(banner_params)
      redirect_to admin_banners_path, notice: 'Banner was successfully updated.'
    else
      flash[:error] = @banner.errors.full_messages
      render :edit
    end
  end

  # DELETE /banners/1
  def destroy
    @banner.destroy
    redirect_to admin_banners_path, notice: 'Banner was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_banner
    @banner = Banner.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def banner_params
    params.require(:banner).permit(:banner_id, :image, :link, :id, :active, :row_order_position)
  end
end
