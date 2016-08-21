class DecisionPoint < ApplicationRecord
  belongs_to :part

  serialize :answers, Hash
end
