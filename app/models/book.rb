class Book < ApplicationRecord
  belongs_to :user

  has_many :chapters
  has_many :parts, through: :chapters
  has_many :reviews
  has_many :progresses

  has_and_belongs_to_many :genres
  has_and_belongs_to_many :shelves

  has_attached_file :cover,
    styles: { medium: "300x300>", thumb: "253x325>" },
    default_url: "/images/placeholder.png"

  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
  
  scope :best, -> (n = 10) { order(created_at: :desc).limit(n) }
end
