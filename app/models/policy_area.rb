class PolicyArea < ApplicationRecord
  has_many :votes
  has_many :matches
end
