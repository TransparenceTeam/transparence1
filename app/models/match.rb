class Match < ApplicationRecord
  belongs_to :post
  belongs_to :policy_area
  belongs_to :project_law
  belongs_to :tweet
  # belongs_to :user
  # has_one :tweet, :through => :post
end
