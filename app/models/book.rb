class Book < ApplicationRecord
  belongs_to :user

  has_many :chapters
  has_many :parts, through: :chapters
  has_many :reviews
  has_many :progresses

  has_and_belongs_to_many :genres
  has_and_belongs_to_many :shelves

  scope :best, -> (n = 10) { order(created_at: :desc).limit(n) }
end
