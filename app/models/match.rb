class Match < ApplicationRecord
  belongs_to :post
  belongs_to :policy_area
  belongs_to :project_law
end
