class Part < ApplicationRecord
  belongs_to :chapter
  has_one :decision_point
end
