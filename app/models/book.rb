class Book < ApplicationRecord
  belongs_to :user

  has_many :chapters
  has_many :parts, through: :chapters

  has_and_belongs_to_many :genres
end
