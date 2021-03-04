class Tweet < ApplicationRecord
  belongs_to :politician
  has_one :post, dependent: :destroy
  # validates :tweet_id, presence: true, uniqueness: true
end
