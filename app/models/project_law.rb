class ProjectLaw < ApplicationRecord
  validates :scrutin, presence: true, uniqueness: true
  validates :name, presence: true
  validates :url, presence: true
  has_many :votes
  has_many :matches

  def last_100
   projectlaw_100 = Projectlaw.last(1)
  end
end
