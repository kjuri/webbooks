class Part < ApplicationRecord
  default_scope { includes(decision_point: [:answers]) }

  belongs_to :chapter
  has_one :decision_point
  has_many :progresses
end
