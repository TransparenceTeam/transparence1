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


      def user_timeline_endpoint(twitter_username)
        JSON.parse(@access_token.request(:get, "#{BASE_URI}statuses/user_timeline.json?screen_name=#{twitter_username}&count=2&tweet_mode=extended")
        .body)
      end
    end

    politicians = Politician.all
    politicians.each do |politician|
      puts politician.twitter_username
      api = ApiTwitter.new
      puts api.user_timeline_endpoint(politician.twitter_username)

      tweets_content = api.user_timeline_endpoint(politician.twitter_username)

      tweets_content.each do |user|

        unless Tweet.exists?(tweet_id: user['id'])
          new_tweet = Tweet.create!(
            username: user['user']['screen_name'],
            content: user['full_text'],
            hashtag: user['entities']['hashtags'],
            date: user['created_at'],
            tweet_id: user['id'],
            expanded_tweet_url: user['entities']['urls'][0]['expanded_url'],
            in_reply_to_status: user['in_reply_to_status_id'],
            user_description: user['user']['description'],
            expanded_url: user['user']['entities']['url']['urls'][0]['expanded_url'],
            followers_count: user['user']['followers_count'],
            friends_count: user['user']['friends_count'],
            listed_count: user['user']['listed_count'],
            avatar_url: user['user']['profile_image_url'],
            avatar_https: user['user']['profile_image_url_https'],
            lang: user['lang'],
            location: user['user']['location'],
            politician_id: politician.id
          )
          puts "tweet id #{new_tweet.tweet_id} has been created from #{new_tweet.username} twitter profile"
        end

      end

    end
  end
end

#rake db:fetch_api_twitter
