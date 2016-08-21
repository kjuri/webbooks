class UserDecorator < Draper::Decorator
  delegate :admin?, :writer?
  
  def primary_role
    return :admin if admin?
    return :writer if writer?
    :reader
  end

  def primary_role_name
    primary_role.to_s.titleize
  end
end
