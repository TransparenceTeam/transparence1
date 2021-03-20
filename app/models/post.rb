class Post < ApplicationRecord
  belongs_to :tweet
  belongs_to :user
  has_many :user_posts, dependent: :destroy
  has_many :matches, dependent: :destroy
  acts_as_favoritable

  include PgSearch::Model
  pg_search_scope :search_by_politico,
    against: [ :name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
