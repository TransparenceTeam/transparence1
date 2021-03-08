class ProjectLaw < ApplicationRecord
  validates :scrutin, presence: true, uniqueness: true
  validates :name, presence: true
  validates :url, presence: true
  has_many :votes
  has_many :matches
  before_save :fetch_translated_tweet

  #def last_100
  # projectlaw_100 = Projectlaw.last(1)
  #end

  #include AlgoliaSearch
  #algoliasearch do
  #  attributes :name
  #end
  def fetch_translated_law

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
