class Tweet < ApplicationRecord
  belongs_to :politician
  has_many :posts, dependent: :destroy
  validates :tweet_id, presence: true, uniqueness: true
end
