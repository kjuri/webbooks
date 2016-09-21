class ReviewForm < BaseForm
  property :content
  property :rating
  property :user
  property :book

  validates_uniqueness_of :user, scope: :book
end
