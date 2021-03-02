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
        JSON.parse(@access_token.request(:get, "#{BASE_URI}statuses/user_timeline.json?screen_name=#{twitter_username}&count=50&tweet_mode=extended")
        .body)
      end
    end

    #1366313416252620802

    #politicians = Politician.all
    #politicians.each do |politician|
      #puts politician.twitter_username
    api = ApiTwitter.new

    tweets_content = api.user_timeline_endpoint("EmmanuelMacron")

    tweets_content.each do |tweet|
      begin
        begin
          puts "--------"
          puts "____#####____ Tweet with content WITH media and reply WITH media ____#####____"
          puts "--------"
          puts tweet['user']['screen_name']
          puts tweet['full_text']
          puts tweet['entities']['hashtags']
          puts Time.new(tweet['created_at']).strftime('%a %d %b %Y')
          puts tweet['id']
          #puts tweet['entities']['urls'][0]['expanded_url']
          puts tweet['user']['description']
          puts tweet['user']['followers_count']
          puts tweet['user']['friends_count']
          puts tweet['user']['listed_count']
          puts tweet['user']['profile_image_url']
          puts tweet['user']['profile_image_url_https']
          puts tweet['lang']
          puts tweet['user']['location']
          #puts politician.id
          puts tweet['entities']['media'][0]['media_url'][''] # picture
          puts tweet['extended_entities']['media'][0]['media_url'] #
          puts tweet['quoted_status']['user']['screen_name']
          puts Time.new(tweet['quoted_status']['created_at']).strftime('%a %d %b %Y')
          puts tweet['quoted_status']['id']
          puts tweet['quoted_status']['full_text']
          puts tweet['quoted_status']['user']['location']
          puts tweet['quoted_status']['entities']['hashtags'][0]['text']
          puts tweet['quoted_status']['user']['description']
          puts tweet['quoted_status']['user']['profile_image_url']
          puts tweet['quoted_status']['user']['profile_image_url_https']
          puts tweet['quoted_status']['user']['followers_count']
          puts tweet['quoted_status']['user']['friends_count']
          puts tweet['quoted_status']['user']['listed_count']
          puts tweet['quoted_status']['entities']['media'][0]['media_url_https']
          puts tweet['quoted_status']['extended_entities']['media'][0]['video_info']['variants'][0]['url']
        rescue
          puts "--------"
          puts "____#####____ Tweet with content WITHOUT media and reply WITH media ____#####____"
          puts "--------"
          puts tweet['user']['screen_name']
          puts tweet['full_text']
          puts tweet['entities']['hashtags']
          puts Time.new(tweet['created_at']).strftime('%a %d %b %Y')
          puts tweet['id']
          puts tweet['entities']['urls'][0]['expanded_url']
          puts tweet['user']['description']
          puts tweet['user']['followers_count']
          puts tweet['user']['friends_count']
          puts tweet['user']['listed_count']
          puts tweet['user']['profile_image_url']
          puts tweet['user']['profile_image_url_https']
          puts tweet['lang']
          puts tweet['user']['location']
          #puts politician.id,
          puts tweet['quoted_status']['user']['screen_name']
          puts Time.new(tweet['quoted_status']['created_at']).strftime('%a %d %b %Y')
          puts tweet['quoted_status']['id']
          puts tweet['quoted_status']['full_text']
          puts tweet['quoted_status']['user']['location']
          puts tweet['quoted_status']['entities']['hashtags']
          puts tweet['quoted_status']['user']['description']
          puts tweet['quoted_status']['user']['profile_image_url']
          puts tweet['quoted_status']['user']['profile_image_url_https']
          puts tweet['quoted_status']['user']['followers_count']
          puts tweet['quoted_status']['user']['friends_count']
          puts tweet['quoted_status']['user']['listed_count']
          puts tweet['quoted_status']['entities']['media'][0]['media_url_https']
          puts tweet['quoted_status']['extended_entities']['media'][0]['video_info']['variants'][0]['url']
        end
      rescue
        begin
          puts "--------"
          puts "____#####____ Tweet with content WITHOUT media and retweet WITHOUT media ____#####____"
          puts "--------"
          puts tweet['user']['screen_name']
          puts tweet['full_text']
          puts tweet['entities']['hashtags']
          puts Time.new(tweet['created_at']).strftime('%a %d %b %Y')
          puts tweet['id']
          #puts tweet['entities']['urls'][0]['expanded_url']
          puts tweet['user']['description']
          puts tweet['user']['followers_count']
          puts tweet['user']['friends_count']
          puts tweet['user']['listed_count']
          puts tweet['user']['profile_image_url']
          puts tweet['user']['profile_image_url_https']
          puts tweet['lang']
          puts tweet['user']['location']
          #puts politician.id
          puts tweet['quoted_status']['user']['screen_name']
          puts Time.new(tweet['quoted_status']['created_at']).strftime('%a %d %b %Y')
          puts tweet['quoted_status']['id']
          puts tweet['quoted_status']['full_text']
          puts tweet['quoted_status']['user']['location']
          puts tweet['quoted_status']['entities']['hashtags']
          puts tweet['quoted_status']['user']['description']
          puts tweet['quoted_status']['user']['profile_image_url']
          puts tweet['quoted_status']['user']['profile_image_url_https']
          puts tweet['quoted_status']['user']['followers_count']
          puts tweet['quoted_status']['user']['friends_count']
          puts tweet['quoted_status']['user']['listed_count']

        rescue
          begin
            puts "--------"
            puts "____#####____ Tweet with content WITH media ____#####____"
            puts "--------"
            puts tweet['user']['screen_name']
            puts tweet['full_text']
            puts tweet['entities']['hashtags']
            puts Time.new(tweet['created_at']).strftime('%a %d %b %Y')
            puts tweet['id']
            puts tweet['in_reply_to_status_id']
            puts tweet['user']['description']
            puts tweet['user']['followers_count']
            puts tweet['user']['friends_count']
            puts tweet['user']['listed_count']
            puts tweet['user']['profile_image_url']
            puts tweet['user']['profile_image_url_https']
            puts tweet['lang']
            puts tweet['user']['location']
            #puts politician.id
            puts tweet['entities']['media']['media_url'][''] # picture
            puts tweet['entities']['media']['video_info']['variants'][0]['url'] # video

          rescue
            begin
              puts "--------"
              puts "____#####____ Tweet WITH content WITHOUT media ____#####____"
              puts "--------"
              puts tweet['user']['screen_name']
              puts tweet['full_text']
              puts tweet['entities']['hashtags']
              puts Time.new(tweet['created_at']).strftime('%a %d %b %Y')
              puts tweet['id']
              puts tweet['in_reply_to_status_id']
              puts tweet['user']['description']
              puts tweet['user']['followers_count']
              puts tweet['user']['friends_count']
              puts tweet['user']['listed_count']
              puts tweet['user']['profile_image_url']
              puts tweet['user']['profile_image_url_https']
              puts tweet['lang']
              puts tweet['user']['location']
            end
          end
        end
      end
    end
  end
end
#rake db:fetch_api_twitter



