class Vote < ApplicationRecord
  validates :deputy_id, presence: true
  validates :project_law_id, presence: true
  validates :position, presence: true
  belongs_to :deputy
  belongs_to :project_law
end
