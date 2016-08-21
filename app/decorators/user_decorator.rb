class UserDecorator < Drape::Decorator
  delegate :primary_role

  def primary_role_name
    primary_role.to_s.titleize
  end

  def home_partial
    "partials/#{primary_role.to_s}_page"
  end
end
