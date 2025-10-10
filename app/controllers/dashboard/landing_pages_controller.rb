class Dashboard::LandingPagesController < Dashboard::BaseController


  before_action :set_landing_page


  def show
    @links = @landing_page.links
  end


  def edit
    # @landing_page is already set
  end


  def update
    if @landing_page.update(landing_page_params)
      redirect_to dashboard_landing_page_path, notice: "Landing page updated successfully."
    else
      render :edit
    end
  end

  private

  # Ensures the current user always has a landing page with a valid theme
  def set_landing_page
    @landing_page = current_user.landing_page
    return if @landing_page.present?


    default_theme = Theme.find_by!(key: "default")

    
    @landing_page = current_user.create_landing_page!(
      title: "My Landing Page",
      theme: default_theme
    )
  end

  def landing_page_params
    params.require(:landing_page).permit(:title, :bio, :theme_id)
  end

end
