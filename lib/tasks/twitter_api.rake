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

      NUMBER_OF_TWEETS_TO_LOOK_FOR = 1

      def initialize
        consumer = OAuth::Consumer.new(CONSUMER_KEY, CONSUMER_SECRET, { site: 'https://api.twitter.com', scheme: :header })
        token_hash = { oauth_token: OA_TOKEN, oauth_token_secret: OA_SECRET }
        @access_token = OAuth::AccessToken.from_hash(consumer, token_hash)
      end


      def user_timeline_endpoint(username)
        JSON.parse(@access_token.request(:get, "#{BASE_URI}statuses/user_timeline.json?screen_name=#{username}&count=1&tweet_mode=extended")
        .body)
      end
    end

    api = ApiTwitter.new
    tweets_content = api.user_timeline_endpoint("EmmanuelMacron")

   tweets_content.each do |user|
      puts user['created_at'] #ok
      puts user['id']
      puts "full_text:" #ok
      puts user['full_text'] #ok
      puts "entities - hastag:" #ok
      puts user['entities']['hashtags'] #ok

      puts user['entities']['urls'][0]['expanded_url']# ok, cest le lien du content du retweet

      puts user['in_reply_to_status_id'] # on garde, cest le status quand le mec reponds

      puts user['in_reply_to_user_id']

      puts user['user']['screen_name'] # on garde, issue with baptiste

      puts user['user']['location']  #on garde

      puts user['user']['description']  # titre de la position

      puts user['user']['entities']['url']['urls'][0]['expanded_url'] #on garde

      puts user['user']['followers_count'] # on garde

      puts user['user']['friends_count'] #on garde

      puts user['user']['listed_count'] #on garde, dans cb de liste twitter est present (currated liste)

      puts user['user']['profile_image_url'] # avatar on garde

      puts user['user']['profile_image_url_https'] #avatar on garde

      puts user['lang']

    end
  end
end
