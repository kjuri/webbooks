class Users::SessionsController < Devise::SessionsController
  # GET /resource/sign_in
  def new
    build_resource(sign_in_params)
    clean_up_passwords(resource)

    yield resource if block_given?
    respond_with(resource, serialize_options(resource))
  end

  protected

  def build_resource(hash = nil)
    self.resource = Users::SessionForm.new(resource_class.new)
  end

  def after_sign_in_path_for(resource)
    return admin_home_path if resource.admin?
    return reader_home_path if resource.reader?
    writer_home_path
  end
end
