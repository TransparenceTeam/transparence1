namespace :db do
  desc "tweeter baptiste test"
  task twitter_api: :environment do

    require 'twitter'
    require 'pry'

    client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end

    #tweets = client.user_timeline('EmmanuelMacron', count: 20)
      #puts  tweets
    # tweet_user = client.user('EmmanuelMacron')
    #   puts tweet_user
    # tweet_follow = client.follow('EmmanuelMacron')
    #   puts tweet_user
    #puts "full text: "
    #tweets.each {|tweet| puts tweet.full_text}
    #puts "uri: "
    #tweets.each {|tweet| puts tweet.uri}
    #puts "text: "
    #tweets.each {|tweet| puts tweet.text}
    #bieber = client.search("from:EmmanuelMacron", result_type: "recent").take(3).each do |tweet|
      #puts tweet.text
    #end

    tweets = client.search('EmmanuelMacron', count: 1)

    tweets.each do |tweet|
      binding.pry
    end
  end


end


#rake db:twitter_api
#rake db:fetch_api_twitter

