require 'oauth'
require 'json'


namespace :db do
  desc "tweets injection"
  task fetch_api_twitter: :environment do

    class ApiTwitter

      CONSUMER_KEY = 'FXT0aPogM3d34gdcQuvspRunJ'
      CONSUMER_SECRET = 'BJ73hI7TvkBY3njtEgOMKoQNW5HlXKmDNzHNUEGhogSAAIBOot'

      OA_TOKEN = '486094169-Kn3Ky9v0xk34hDmS2u8uDSfLVQKzST82soP9R7T3'
      OA_SECRET = 'UonCSEohfanGpWDrrzBKHkKPhfsnrwpRmtxTrf2b1YwQS'

      BASE_URI = 'https://api.twitter.com/1.1/'

      def initialize
        consumer = OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET, { site: 'https://api.twitter.com', scheme: :header })
        token_hash = { oauth_token: OA_TOKEN, oauth_token_secret: OA_SECRET }
        @access_token = OAuth::AccessToken.from_hash(consumer, token_hash)
      end

      def home_line option = nil
        JSON.parse(@access_token.request(:get, "#{BASE_URI}search/tweets.json?q=MLP_officiel").body)
      end
    end
    api = ApiTwitter.new
    user_list = api.home_line
    user_list.each do |user|
      puts user



    end
  end
end
