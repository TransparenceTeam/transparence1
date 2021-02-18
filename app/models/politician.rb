class Politician < ApplicationRecord
  has_many :tweets, dependent: :destroy
  belongs_to :political_group
end
