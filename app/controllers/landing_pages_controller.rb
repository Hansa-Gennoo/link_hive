class LandingPagesController < ApplicationController

  def index
    # This can later render a marketing homepage, sign-up CTA, etc.
  end

 def show
    @user = User.find_by(username: params[:username])
    if @user.present?
      @landing_page = @user.landing_page
    else
      render file: "#{Rails.root}/public/404.html", status: :not_found
    end

    @links = @landing_page.links.order(:position)
  end

end
