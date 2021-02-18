class ProjectLaw < ApplicationRecord
  validates :scrutin, presence: true, uniqueness: true
  validates :name, presence: true
  validates :url, presence: true
  has_many :votes
end
