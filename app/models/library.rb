class Library < ApplicationRecord
  belongs_to :user
  has_many :shelves, dependent: :destroy
  has_many :books, through: :shelves
end
