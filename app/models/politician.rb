class Politician < ApplicationRecord
  has_many :tweets, dependent: :destroy
end
