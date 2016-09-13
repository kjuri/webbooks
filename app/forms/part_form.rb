class PartForm < BaseForm
  property :title
  property :content

  property :decision_point, form: DecisionPointForm

  validates :title, presence: true
end
