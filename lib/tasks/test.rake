require 'oauth'
require 'json'

namespace :db do
  desc "foo"
  task test_twitter: :environment do

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


      def user_timeline_endpoint(twitter_username)
        JSON.parse(@access_token.request(:get, "#{BASE_URI}statuses/user_timeline.json?screen_name=#{twitter_username}&count=50&tweet_mode=extended")
        .body)
      end
    end

    politicians = Politician.all
    politicians.each do |politician|
      puts politician.twitter_username
      api = ApiTwitter.new

      tweets_content = api.user_timeline_endpoint(politician.twitter_username)

      tweets_content.each do |tweet|
        puts tweet['id']
        puts tweet

      end

    end
  end
end

#rake db:fetch_api_twitter
