class BookForm < BaseForm
  property :title
  property :subtitle
  property :short_description
  property :description
  property :user

  collection :chapters, form: ChapterForm
  collection :genres do
    property :name
  end

  validates :title, presence: true
  validates :short_description, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :user, presence: true
end
