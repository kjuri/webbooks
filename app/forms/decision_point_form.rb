class DecisionPointForm < BaseForm
  property :question
  collection :answers do
    property :answer
    property :part_id
  end
end
