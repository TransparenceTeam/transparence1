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
        JSON.parse(@access_token.request(:get, "#{BASE_URI}statuses/user_timeline.json?screen_name=#{twitter_username}&count=20&tweet_mode=extended")
        .body)
      end
    end

    api = ApiTwitter.new
    politicians = Politician.all
    politicians.each do |politician|
      puts politician.twitter_username
      tweets_content = api.user_timeline_endpoint(politician.twitter_username)

      tweets_content.each do |tweet|
        begin
          begin
            new_tweet = Tweet.create!(
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
              retweet_username: tweet['quoted_status']['user']['screen_name'],
              retweet_date: tweet['quoted_status']['created_at'],
              retweet_id: tweet['quoted_status']['id'],
              retweet_content: tweet['quoted_status']['full_text'],
              retweet_location: tweet['quoted_status']['user']['location'],
              retweet_hashtag: tweet['quoted_status']['entities']['hashtags'][0]['text'],
              retweet_user_description: tweet['quoted_status']['user']['description'],
              retweet_avatar_http: tweet['quoted_status']['user']['profile_image_url'],
              retweet_avatar_https: tweet['quoted_status']['user']['profile_image_url_https'],
              retweet_followers_count: tweet['quoted_status']['user']['followers_count'],
              retweet_friends_count: tweet['quoted_status']['user']['friends_count'],
              retweet_listed_count: tweet['quoted_status']['user']['listed_count'],
              picture: tweet['entities']['media'][0]['media_url'][''],
              media: tweet['extended_entities']['media'][0]['media_url'],
              retweet_photo: tweet['quoted_status']['entities']['media'][0]['media_url_https'],
              retweet_media: tweet['quoted_status']['extended_entities']['media'][0]['video_info']['variants'][0]['url']
            )
            puts "Tweet #{new_tweet.id} (id from dB) / Tweet_id #{new_tweet.tweet_id} has been created"
          rescue
            new_tweet = Tweet.create!(
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
              retweet_username: tweet['quoted_status']['user']['screen_name'],
              retweet_date: tweet['quoted_status']['created_at'],
              retweet_id: tweet['quoted_status']['id'],
              retweet_content: tweet['quoted_status']['full_text'],
              retweet_location: tweet['quoted_status']['user']['location'],
              retweet_hashtag: tweet['quoted_status']['entities']['hashtags'],
              retweet_user_description: tweet['quoted_status']['user']['description'],
              retweet_avatar_http: tweet['quoted_status']['user']['profile_image_url'],
              retweet_avatar_https: tweet['quoted_status']['user']['profile_image_url_https'],
              retweet_followers_count: tweet['quoted_status']['user']['followers_count'],
              retweet_friends_count: tweet['quoted_status']['user']['friends_count'],
              retweet_listed_count: tweet['quoted_status']['user']['listed_count'],
              retweet_photo: tweet['quoted_status']['entities']['media'][0]['media_url_https'],
              retweet_media: tweet['quoted_status']['extended_entities']['media'][0]['video_info']['variants'][0]['url'],
            )
            puts "Tweet #{new_tweet.id} (id from dB) / Tweet_id #{new_tweet.tweet_id} has been created"
          end
        rescue
          begin
            new_tweet = Tweet.create!(
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
              retweet_username: tweet['quoted_status']['user']['screen_name'],
              retweet_date: tweet['quoted_status']['created_at'],
              retweet_id: tweet['quoted_status']['id'],
              retweet_content: tweet['quoted_status']['full_text'],
              retweet_location: tweet['quoted_status']['user']['location'],
              retweet_hashtag: tweet['quoted_status']['entities']['hashtags'],
              retweet_user_description: tweet['quoted_status']['user']['description'],
              retweet_avatar_http: tweet['quoted_status']['user']['profile_image_url'],
              retweet_avatar_https: tweet['quoted_status']['user']['profile_image_url_https'],
              retweet_followers_count: tweet['quoted_status']['user']['followers_count'],
              retweet_friends_count: tweet['quoted_status']['user']['friends_count'],
              retweet_listed_count: tweet['quoted_status']['user']['listed_count']
            )
            puts "Tweet #{new_tweet.id} (id from dB) / Tweet_id #{new_tweet.tweet_id} has been created"
          rescue
            begin
              new_tweet = Tweet.create!(
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
                picture: tweet['entities']['media']['media_url'][''], # picture
                media: tweet['entities']['media']['video_info']['variants'][0]['url'] # video
              )
              puts "Tweet #{new_tweet.id} (id from dB) / Tweet_id #{new_tweet.tweet_id} has been created"
            rescue
              begin
                new_tweet = Tweet.create!(
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
                  politician_id: politician.id
                )
                puts "Tweet #{new_tweet.id} (id from dB) / Tweet_id #{new_tweet.tweet_id} has been created"
              rescue
                puts "fuck"
              end
            end
          end
        end
      end
    end
  end
end

#rake db:fetch_api_twitter


