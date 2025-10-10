class Dashboard::LandingPagesController < ApplicationController


  before_action :set_landing_page

  # GET /dashboard/landing_page
  def show
    @links = @landing_page.links
  end

  # GET /dashboard/landing_page/edit
  def edit
    # @landing_page is already set
  end

  # PATCH/PUT /dashboard/landing_page
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

    # Pick a default theme (you can customize this logic)
    default_theme = Theme.first || Theme.create!(
      name: "Default Theme",
      key: "default"   # or any value you want as your fallback theme key
    )
    @landing_page = current_user.create_landing_page!(
      title: "My Landing Page",
      theme: default_theme
    )
  end

  def landing_page_params
    params.require(:landing_page).permit(:title, :bio, :theme_id)
  end

end
