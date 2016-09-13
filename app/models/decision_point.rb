class DecisionPoint < ApplicationRecord
  belongs_to :part
  has_many :answers

  accepts_nested_attributes_for :answers
end
