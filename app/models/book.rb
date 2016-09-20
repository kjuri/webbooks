class Book < ApplicationRecord
  belongs_to :user

  has_many :chapters, dependent: :destroy
  has_many :parts, through: :chapters
  has_many :reviews, dependend: :destroy
  has_many :progresses, dependend: :destroy

  has_and_belongs_to_many :genres
  has_and_belongs_to_many :shelves

  has_attached_file :cover,
    styles: { medium: "300x300>", thumb: "253x325>" },
    default_url: "/assets/placeholder.png"

  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

  scope :best, -> (n = 10) {
    joins(:reviews)
      .select('books.*, avg(reviews.rating) as avg_rating')
      .group('books.id')
      .order('avg_rating desc').limit(n)
  }
  scope :search, (lambda do |query|
    where("title LIKE :query OR subtitle LIKE :query " \
      "OR short_description LIKE :query OR description LIKE :query", { query: "%#{query}%" })
  end)
end
