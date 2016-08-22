class PartForm < BaseForm
  property :content

  property :decision_point do
    property :question
    collection :answers do
      property :answer
      property :part_id
    end
  end
end
