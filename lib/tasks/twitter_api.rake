require 'oauth'
require 'json'
require 'time'

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
        JSON.parse(@access_token.request(:get, "#{BASE_URI}statuses/user_timeline.json?screen_name=#{twitter_username}&count=20&tweet_mode=extended")
        .body)
      end

      def fucking_nested_data(tweet, fields)
        fields.each do |field|
          if tweet[field].nil?
            tweet = nil
            break
          else
          tweet = tweet[field]
          end
        end
        tweet
      end
    end

    api = ApiTwitter.new
    politicians = Politician.all
    politicians.each do |politician|
      puts politician.twitter_username

      tweets_content = api.user_timeline_endpoint(politician.twitter_username)

      tweets_content.each do |tweet|
        unless Tweet.exists?(tweet_id: tweet['id'])
          new_tweet = Tweet.create!(
            name: tweet['user']['name'],
            username: tweet['user']['screen_name'],
            content: tweet['full_text'],
            hashtag: tweet['entities']['hashtags'],
            date: tweet['created_at'],
            tweet_id: tweet['id'],
            user_description: tweet['user']['description'],
            followers_count: tweet['user']['followers_count'],
            friends_count: tweet['user']['friends_count'],
            listed_count: tweet['user']['listed_count'],
            avatar_http: tweet['user']['profile_image_url'],
            avatar_https: tweet['user']['profile_image_url_https'],
            lang: tweet['lang'],
            location: tweet['user']['location'],
            politician_id: politician.id,
            retweet_username: api.fucking_nested_data(tweet, ['quoted_status','user','screen_name']),
            retweet_date: api.fucking_nested_data(tweet, ['extended_entities','media',0, 'video_info','variants',0, 'url']),
            retweet_id: api.fucking_nested_data(tweet, ['quoted_status','id']),
            retweet_content: api.fucking_nested_data(tweet, ['quoted_status','full_text']),
            retweet_location: api.fucking_nested_data(tweet, ['quoted_status','user','location']),
            retweet_hashtag: api.fucking_nested_data(tweet, ['quoted_status','entities','hashtags',0,'text']),
            retweet_user_description: api.fucking_nested_data(tweet, ['quoted_status','user','description']),
            retweet_avatar_http: api.fucking_nested_data(tweet, ['quoted_status','user','profile_image_url']),
            retweet_avatar_https: api.fucking_nested_data(tweet, ['quoted_status','user','profile_image_url_https']),
            retweet_followers_count: api.fucking_nested_data(tweet, ['quoted_status','user','followers_count']),
            retweet_friends_count: api.fucking_nested_data(tweet, ['quoted_status','user','friends_count']),
            retweet_listed_count: api.fucking_nested_data(tweet, ['quoted_status','user','listed_count']),
            picture: api.fucking_nested_data(tweet, ['extended_entities','media', 0, 'media_url']),
            media: api.fucking_nested_data(tweet, ['extended_entities','media',0, 'video_info','variants',0, 'url']),
            retweet_photo: api.fucking_nested_data(tweet, ['quoted_status','entities','media',0,'media_url_https']),
            retweet_media: api.fucking_nested_data(tweet, ['quoted_status','extended_entities','media',0,'video_info','variants',0,'url'])
          )
          puts "Tweet #{new_tweet.id} (id from dB) / Tweet_id #{new_tweet.tweet_id} has been created"
        end
      end
    end
  end
end
