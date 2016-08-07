class Users::RegistrationsController < Devise::RegistrationsController
  # POST /resource
  def create
    build_resource(sign_up_params)

    yield resource if block_given?
    if resource.save
      # Do saved stuff...
    else
      # Re-render to fix
    end
  end

  protected

  def build_resource(hash = nil)
    self.resource = Users::RegistrationForm.new(resource_class.new)
    resource.validate hash unless hash.nil? || hash.length.zero?
  end

  def after_sign_up_path_for
    root_path
  end
end
