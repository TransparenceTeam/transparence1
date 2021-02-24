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
        JSON.parse(@access_token.request(:get, "#{BASE_URI}statuses/user_timeline.json?
          screen_name=#{username}
          &#{NUMBER_OF_TWEETS_TO_LOOK_FOR}=1
          &tweet_mode=extended")
        .body)
      end
    end

    api = ApiTwitter.new
    tweets_content = api.user_timeline_endpoint("EmmanuelMacron")

   tweets_content.each do |user|
      #puts user
      puts ""
      puts "created_at:"
      puts user['created_at']
      puts ""
      puts "id:"
      puts user['id']
      puts ""
      puts "id_str:"
      puts user['id_str']
      puts ""
      puts "full_text:"
      puts user['full_text']
      puts ""
      puts "truncated:"
      puts user['truncated']
      puts ""
      puts "entities - hastag:"
      puts user['entities']['hashtags']
      puts ""
      puts "entities-symbols:"
      puts user['entities']['symbols']
      puts ""
      puts "entities-user_mentions:"
      puts user['entities']['user_mentions']
      puts ""
      puts "entities-urls-0-url:"
      puts user['entities']['urls'][0]['url']
      puts ""
      puts "entities-urls-0-expanded_url:"
      puts user['entities']['urls'][0]['expanded_url']
      puts ""
      puts "entities-urls-0-display_url:"
      puts user['entities']['urls'][0]['display_url']
      puts ""
      puts "entities-urls-0-indices:"
      puts user['entities']['urls'][0]['indices']
      puts ""
      puts "source:"
      puts user['source']
      puts ""
      puts "in_reply_to_status_id:"
      puts user['in_reply_to_status_id']
      puts ""
      puts "in_reply_to_status_id_str:"
      puts user['in_reply_to_status_id_str']
      puts ""
      puts "in_reply_to_user_id:"
      puts user['in_reply_to_user_id']
      puts ""
      puts "in_reply_to_user_id_str:"
      puts user['in_reply_to_user_id_str']
      puts ""
      puts "in_reply_to_screen_name:"
      puts user['in_reply_to_screen_name']
      puts ""
      puts "user-id:"
      puts user['user']['id']
      puts ""
      puts "user-id_str:"
      puts user['user']['id_str']
      puts ""
      puts "user-name:"
      puts user['user']['name']
      puts ""
      puts "user-screen_name:"
      puts user['user']['screen_name']
      puts ""
      puts "user-location:"
      puts user['user']['location']
      puts ""
      puts "user-description:"
      puts user['user']['description']
      puts ""
      puts "user-url:"
      puts user['user']['url']
      puts ""
      puts "user-entities-url-urls-0-urls-0-url:"
      puts user['user']['entities']['url']['urls'][0]['url']
      puts ""
      puts "user-entities-url-urls-0-urls-0-expanded_url:"
      puts user['user']['entities']['url']['urls'][0]['expanded_url']
      puts ""
      puts "user-entities-url-urls-0-urls-0-display_url:"
      puts user['user']['entities']['url']['urls'][0]['display_url']
      puts ""
      puts "user-entities-url-urls-0-urls-0-indices:"
      puts user['user']['entities']['url']['urls'][0]['indices']
      puts ""
      puts "user-entities-description-urls:"
      puts user['user']['entities']['description']['urls']
      puts ""
      puts "user-protected:"
      puts user['user']['protected']
      puts ""
      puts "user-followers_count:"
      puts user['user']['followers_count']
      puts ""
      puts "user-friends_count:"
      puts user['user']['friends_count']
      puts ""
      puts "user-listed_count:"
      puts user['user']['listed_count']
      puts ""
      puts "user-created_at:"
      puts user['user']['created_at']
      puts ""
      puts "user-favourites_count:"
      puts user['user']['favourites_count']
      puts ""
      puts "user-utc_offset:"
      puts user['user']['utc_offset']
      puts ""
      puts "user-time_zone:"
      puts user['user']['time_zone']
      puts ""
      puts "user-geo_enabled:"
      puts user['user']['geo_enabled']
      puts ""
      puts "user-verified:"
      puts user['user']['verified']
      puts ""
      puts "user-statuses_count:"
      puts user['user']['statuses_count']
      puts ""
      puts "user-lang:"
      puts user['user']['lang']
      puts ""
      puts "user-contributors_enabled:"
      puts user['user']['contributors_enabled']
      puts ""
      puts "user-is_translator:"
      puts user['user']['is_translator']
      puts ""
      puts "user-is_translation_enabled:"
      puts user['user']['is_translation_enabled']
      puts ""
      puts "user-profile_background_color:"
      puts user['user']['profile_background_color']
      puts ""
      puts "user-profile_background_image_url:"
      puts user['user']['profile_background_image_url']
      puts ""
      puts "user-profile_background_image_url_https:"
      puts user['user']['profile_background_image_url_https']
      puts ""
      puts "user-profile_background_tile:"
      puts user['user']['profile_background_tile']
      puts ""
      puts "user-profile_image_url:"
      puts user['user']['profile_image_url']
      puts ""
      puts "user-profile_image_url_https:"
      puts user['user']['profile_image_url_https']
      puts ""
      puts "user-profile_banner_url:"
      puts user['user']['profile_banner_url']
      puts ""
      puts "user-profile_link_color:"
      puts user['user']['profile_link_color']
      puts ""
      puts "user-profile_sidebar_border_color:"
      puts user['user']['profile_sidebar_border_color']
      puts ""
      puts "user-profile_sidebar_fill_color:"
      puts user['user']['profile_sidebar_fill_color']
      puts ""
      puts "user-profile_text_color:"
      puts user['user']['profile_text_color']
      puts ""
      puts "user-profile_use_background_image:"
      puts user['user']['profile_use_background_image']
      puts ""
      puts "user-has_extended_profile:"
      puts user['user']['has_extended_profile']
      puts ""
      puts "user-default_profile:"
      puts user['user']['default_profile']
      puts ""
      puts "user-default_profile_image:"
      puts user['user']['default_profile_image']
      puts ""
      puts "user-following:"
      puts user['user']['following']
      puts ""
      puts "user-follow_request_sent:"
      puts user['user']['follow_request_sent']
      puts ""
      puts "user-notifications:"
      puts user['user']['notifications']
      puts ""
      puts "user-translator_type:"
      puts user['user']['translator_type']
      puts ""
      puts "user-default_profile_image:"
      puts user['user']['default_profile_image']
      puts ""
      puts "user-geo:"
      puts user['geo']
      puts ""
      puts "user-coordinates:"
      puts user['coordinates']
      puts ""
      puts "user-place:"
      puts user['place']
      puts ""
      puts "user-contributors:"
      puts user['contributors']
      puts ""
      puts "user-is_quote_status:"
      puts user['is_quote_status']
      puts ""
      puts "user-retweet_count:"
      puts user['retweet_count']
      puts ""
      puts "user-favorite_count:"
      puts user['favorite_count']
      puts ""
      puts "user-favorited:"
      puts user['favorited']
      puts ""
      puts "user-retweeted:"
      puts user['retweeted']
      puts ""
      puts "user-possibly_sensitive:"
      puts user['possibly_sensitive']
      puts ""
      puts "user-possibly_sensitive_appealable:"
      puts user['possibly_sensitive_appealable']
      puts ""
      puts "user-lang:"
      puts user['lang']

    end
  end
end
