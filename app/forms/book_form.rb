class BookForm < BaseForm
  property :title
  property :subtitle
  property :short_description
  property :description
  property :user
  property :cover

  collection :chapters, form: ChapterForm
  collection :genre_ids

  validates :title, presence: true
  validates :short_description, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :user, presence: true
  validates :cover, file_content_type: { allow: %w(image/jpg image/jpeg image/png image/gif) }
end
