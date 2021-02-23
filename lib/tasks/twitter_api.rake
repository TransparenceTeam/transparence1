require 'oauth'
require 'json'

namespace :db do
  desc "tweets injection"
  task fetch_api_twitter: :environment do

    class ApiTwitter
      CONSUMER_KEY = ENV['TWITTER_CONSUMER_KEY']
      CONSUMER_SECRET = ENV['TWITTER_CONSUMER_SECRET']

      OA_TOKEN = ENV['TWITTER_ACCESS_TOKEN']
      OA_SECRET = ENV['TWITTER_ACCESS_TOKEN_SECRET']

      BASE_URI = 'https://api.twitter.com/1.1/'

      def initialize
        consumer = OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET, { site: 'https://api.twitter.com', scheme: :header })
        token_hash = { oauth_token: OA_TOKEN, oauth_token_secret: OA_SECRET }
        @access_token = OAuth::AccessToken.from_hash(consumer, token_hash)
      end

      def home_line option = nil
        JSON.parse(@access_token.request(:get, "#{BASE_URI}search/tweets.json?q=EmmanuelMacron").body)
      end
    end
    api = ApiTwitter.new
    user_list = api.home_line
    user_list.each do |user|
      puts user
    end
  end
end
