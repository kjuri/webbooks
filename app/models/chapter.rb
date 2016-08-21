class Chapter < ApplicationRecord
  belongs_to :book
  has_many :parts
end
