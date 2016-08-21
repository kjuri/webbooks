class Book < ApplicationRecord
  has_many :chapters
  has_many :parts, through: :chapters
end
