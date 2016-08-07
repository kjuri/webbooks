class Users::RegistrationForm < Reform::Form
  property :first_name
  property :last_name
  property :email
  property :password
  property :password_confirmation
  property :birthday
  property :username
  property :roles

  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true, confirmation: true, length: { minimum: 8 }
  validates :roles, exclusion: { in: %w(admin) }

  def active_for_authentication?
    true
  end

  def authenticatable_salt; end

  def save
    return false unless valid?
    sync
    model.save
  end
end
