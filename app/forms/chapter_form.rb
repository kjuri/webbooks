class ChapterForm < BaseForm
  property :title
  property :book

  collection :parts, form: PartForm

  validates :book, presence: true
  validates :title, presence: true
end
