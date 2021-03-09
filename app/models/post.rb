class Post < ApplicationRecord
  belongs_to :tweet
  belongs_to :user
  has_many :user_posts, dependent: :destroy
  has_many :matches, dependent: :destroy
end
