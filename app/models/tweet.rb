class Tweet < ApplicationRecord
  # require 'httparty'
  require 'json'
  belongs_to :politician
  has_one :post, dependent: :destroy
  # has_one :match, :through => :post
  # has_many :matches, :through => :post
  # validates :tweet_id, presence: true, uniqueness: true
  before_save :fetch_translated_tweet

  private

  def fetch_translated_tweet

    con = Faraday.new

    res = con.post do |req|
        req.url 'https://api.deepl.com/v2/translate?auth_key=54dd8f74-c7e7-2689-51ba-b34c61055eca',
        req.body = {text: self.content,
        target_lang: 'EN',
        source_lang: 'FR'
       }
    end
    self.translatedtext = JSON.parse(res.body)["translations"][1]["text"]
  end

end
