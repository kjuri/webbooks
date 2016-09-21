class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "You have no rights to access this page."
    redirect_back(fallback_location: root_path)
  end

  def current_user
    UserDecorator.decorate(super) unless super.nil?
  end
end
