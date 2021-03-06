# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_filters.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin

    rescue_from CanCan::AccessDenied do |exception|
      flash[:alert] = "You have no rights to access this page."
      redirect_back(fallback_location: root_path)
    end

    def authenticate_admin
      raise CanCan::AccessDenied unless current_user && current_user.admin?
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
