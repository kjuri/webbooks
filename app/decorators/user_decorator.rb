class UserDecorator < Drape::Decorator
  delegate :first_name, :last_name, :primary_role

  def primary_role_name
    primary_role.to_s.titleize
  end

  def home_partial
    "partials/#{primary_role.to_s}_page"
  end

  def profile_link_text
    "#{first_name} #{last_name} <i class='fa fa-user' aria-hidden='true'></i>".html_safe
  end
end
