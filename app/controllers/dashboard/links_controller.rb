class Dashboard::LinksController < Dashboard::BaseController
  before_action :set_landing_page

  def index
    @links = Link.all
  end

  def new
    @landing_page = current_user.landing_page


    @link = @landing_page.links.new
  end

  def create
    @link = @landing_page.links.new(link_params)
    if @link.save
      redirect_to dashboard_landing_page_path(@landing_page), notice: "Link created!"
    else
      render :new
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    @link.update(link_params)
    redirect_to landing_page_link_path
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy

    redirect_to landing_page_link_path, notice: 'Link was removed.'
  end

  def reorder
    params[:ids].each_with_index do |id, index|
      @landing_page.links.find(id).update(position: index + 1)
    end
    head :ok
  end

  private

  def set_landing_page
    @landing_page = current_user.landing_page
  end

  def link_params
    params.require(:link).permit(:title, :url, :position)
  end
end
