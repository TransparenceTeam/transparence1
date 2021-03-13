class Tweet < ApplicationRecord
  # require 'httparty'
  require 'json'
  belongs_to :politician
  has_one :post, dependent: :destroy
  # has_one :match, :through => :post
  # has_many :matches, :through => :post #hidden by Victor (13.03.21)
  # validates :tweet_id, presence: true, uniqueness: true
  #before_save :fetch_translated_tweet

  include PgSearch::Model
  pg_search_scope :search_by_politician,
    against: [ :name ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  private

  def fetch_translated_tweet

    con = Faraday.new

    res = con.post do |req|
        req.url 'https://api.deepl.com/v2/translate?auth_key='+ ENV["DEEPL_API"],
        req.body = {text: self.content,
        target_lang: 'EN',
        source_lang: 'FR'
       }
    end
    self.translatedtext = JSON.parse(res.body)["translations"][1]["text"]
  end

end
