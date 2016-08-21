class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    UserDecorator.decorate(super) unless super.nil?
  end
end
