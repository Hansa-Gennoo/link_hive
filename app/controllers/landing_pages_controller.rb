class LandingPagesController < ApplicationController

 def show
    @user = User.find_by(username: params[:username])
    if @user.present?
      @landing_page = @user.landing_page
    else
      render file: "#{Rails.root}/public/404.html", status: :not_found
    end
  end

end
