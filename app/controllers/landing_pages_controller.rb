class LandingPagesController < ApplicationController

  def show
     @landing_page = LandingPage.friendly.find(params[:id])

  end

end
