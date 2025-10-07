class LandingPagesController < ApplicationController

  def show
     @landing_page = LandingPage.find[:params_id]

  end

end
