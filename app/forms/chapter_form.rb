class ChapterForm < BaseForm
  property :title

  collection :parts, form: PartForm
end
