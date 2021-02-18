class Deputy < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  belongs_to :political_group
  has_many :votes
end
