class Tweet < ApplicationRecord
  belongs_to :politician
  has_many :posts, dependent: :destroy
end
