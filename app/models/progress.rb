class Progress < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :part
end
