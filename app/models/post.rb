class Post < ApplicationRecord
  belongs_to :tweet
  belongs_to :user
  has_many :user_posts, dependent: :destroy

  acts_as_favoritable
end
