class UserDecorator < Draper::Decorator
  delegate :primary_role

  def primary_role_name
    primary_role.to_s.titleize
  end
end
