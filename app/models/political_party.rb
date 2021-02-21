class PoliticalParty < ApplicationRecord
  belongs_to :political_group
  has_many :politicians
end
