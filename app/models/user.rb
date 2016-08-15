class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :confirmable

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
end
