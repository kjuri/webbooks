class Library < ApplicationRecord
  belongs_to :user
  has_many :shelves
  has_many :books, through: :shelves
end
