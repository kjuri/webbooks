class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:create, :update]

  # POST /resource
  def create
    build_resource(sign_up_params)

    yield resource if block_given?
    render 'new' unless resource.save
  end

  protected

  def build_resource(hash = nil)
    self.resource = registration_form
    resource.validate hash unless hash.nil? || hash.length.zero?
  end

  def registration_form
    Users::RegistrationForm.new(resource_class.new)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:first_name, :last_name, :email, :password,
                         :password_confirmation, :birthday, :username, roles: [])
    end
  end

  def after_sign_up_path_for(resource)
    resource.sign_in_path
  end
end
