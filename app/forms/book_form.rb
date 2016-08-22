class BookForm < BaseForm
  property :title
  property :short_description
  property :description

  collection :chapters, form: ChapterForm
end
