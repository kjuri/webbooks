class Shelf < ApplicationRecord
  belongs_to :library
  belongs_to :user
  has_and_belongs_to_many :books
end
