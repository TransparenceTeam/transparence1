class Match < ApplicationRecord
  belongs_to :post
  belongs_to :policy_area
  belongs_to :project_law
  #belongs_to :user #hidden by Victor (13.03.21)
  # has_one :tweet, :through => :post
end
