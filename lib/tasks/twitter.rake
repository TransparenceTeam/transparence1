#
# client = Twitter::REST::Client.new do |config|
#   config.consumer_key        = "YOUR_CONSUMER_KEY"
#   config.consumer_secret     = "YOUR_CONSUMER_SECRET"
#   config.access_token        = "YOUR_ACCESS_TOKEN"
#   config.access_token_secret = "YOUR_ACCESS_SECRET"
# end

namespace :db do
  desc "tweeter baptiste test"
  task twitter_api: :environment do
    puts "hello baptiste"

    require 'twitter'

    client = Twitter::REST::Client.new do |config|
      config.consumer_key = 'FXT0aPogM3d34gdcQuvspRunJ'
      config.consumer_secret = 'BJ73hI7TvkBY3njtEgOMKoQNW5HlXKmDNzHNUEGhogSAAIBOot'
      config.access_token = '486094169-Kn3Ky9v0xk34hDmS2u8uDSfLVQKzST82soP9R7T3'
      config.access_token_secret = 'UonCSEohfanGpWDrrzBKHkKPhfsnrwpRmtxTrf2b1YwQS'
    end

    tweets = client.user_timeline('EmmanuelMacron', count: 1)
      puts  tweets
    # tweet_user = client.user('EmmanuelMacron')
    #   puts tweet_user
    # tweet_follow = client.follow('EmmanuelMacron')
    #   puts tweet_user
    tweets.each {|tweet| puts tweet.full_text}
    tweets.each {|tweet| puts tweet.uri}
    tweets.each {|tweet| puts tweet.text}
    bieber = client.search("from:EmmanuelMacron", result_type: "recent").take(3).each do |tweet|
      puts tweet.text
    end
    end
end


 # Get all tweets
# def collect_with_max_id(collection=[], max_id=nil, &block)
#   response = yield(max_id)
#   collection += response
#   response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
# end

# def client.get_all_tweets(user)
#   collect_with_max_id do |max_id|
#     options = {count: 200, include_rts: true}
#     options[:max_id] = max_id unless max_id.nil?
#     user_timeline(user, options)
#   end
# end

# client.get_all_tweets("sferik")
