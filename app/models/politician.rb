class Politician < ApplicationRecord
  has_many :tweets, dependent: :destroy
  belongs_to :political_party
end
