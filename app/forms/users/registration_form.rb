class Users::RegistrationForm < BaseForm
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
    Library.create(user: model)
    Shelf.create(
      name: model.username,
      description: "#{model.username}'s first shelf'",
      private: false,
      library: model.library
    )
    model.save
  end
end
