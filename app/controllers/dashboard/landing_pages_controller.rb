class Dashboard::LandingPagesController < ApplicationController

  before_action :authenticate_user! # or your own auth method
  layout 'dashboard'  # use your dashboard layout

  def show
    @landing_page = current_user.landing_page
    @links = @landing_page.links
  end

  def edit
    @landing_page = LandingPage.find(params[:landing_page_id])
  end

  def update
    if @landing_page.update(landing_page_params)
      redirect_to dashboard_landing_pages_path, notice: "Landing page updated!"
    else
      render :edit
    end
  end

  private

  def landing_page_params
    params.require(:landing_page).permit(:title, :bio, :theme_id)
  end

end
