class PartForm < BaseForm
  property :title
  property :content
  property :chapter

  property :decision_point, form: DecisionPointForm

  validates :title, presence: true
end
