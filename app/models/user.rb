class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :confirmable

  has_one :library, dependent: :destroy
  has_many :shelves, through: :library
  has_many :books
  has_many :progresses

  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }

  ROLES = %i(admin writer reader).freeze

  ROLES.each do |role|
    define_method "#{role}?".to_sym do
      role?(role)
    end
  end

  def roles=(roles)
    roles = [*roles].map(&:to_sym)
    self.roles_mask = (roles & ROLES).map do |r|
      2**ROLES.index(r)
    end.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def role?(role)
    roles.include?(role)
  end

  def primary_role
    return :admin if admin?
    return :writer if writer?
    :reader
  end

  def sign_in_path
    return Rails.application.routes.url_helpers.admin_root_path if admin?
    Rails.application.routes.url_helpers.root_path
  end
end
