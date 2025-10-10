class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protected

  def after_sign_in_path_for(resource)
    dashboard_landing_pages_path # Redirect to user's landing page dashboard
  end

  def after_sign_up_path_for(resource)
    dashboard_landing_pages_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :display_name])
  end
end
