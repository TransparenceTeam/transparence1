class Post < ApplicationRecord
  belongs_to :tweet
  belongs_to :user
  has_many :user_posts, dependent: :destroy
  has_many :matches

  include PgSearch::Model
pg_search_scope :filter_categories,
  against: [:policy_area_id],
  associated_against: {
    policy_areas: [:category]
  },
  using: {
    tsearch: {any_word: true}
  }
end
