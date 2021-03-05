class Tweet < ApplicationRecord
  belongs_to :politician
  has_one :post, dependent: :destroy
  # has_one :match, :through => :post
  # has_many :matchs, :through => :post
  # validates :tweet_id, presence: true, uniqueness: true
end
