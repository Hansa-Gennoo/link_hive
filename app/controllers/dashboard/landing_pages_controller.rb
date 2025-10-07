class Dashboard::LandingPagesController < ApplicationController
  def edit
    @landing_page = LandingPage.find(params[:landing_page_id])
  end

  def update
    @landing_page = LandingPage.find(params[:landing_page_id])
    @landing_page.update(landing_page_params)
    redirect_to landing_page_path
  end

  private

  def landing_page_params
    params.require(:landing_page).permit(:username, :bio, :theme, :slug)
  end
end
