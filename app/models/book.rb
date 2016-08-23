class Book < ApplicationRecord
  has_many :chapters
  has_many :parts, through: :chapters
  has_and_belongs_to_many :genres
end
