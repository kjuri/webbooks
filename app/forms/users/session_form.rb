class Users::SessionForm < Reform::Form
  property :email
  property :password
  property :remember_me

  def self.authentication_keys
    [:email]
  end
end
