require 'oauth'
require 'json'
require 'typhoeus'


namespace :db do
  desc "tweets injection"
  task fetch_api_twitter: :environment do

    consumer_key = '3SLqhJAJ85lEdCl4ulugo7gBQ'
    consumer_secret = 'FdIvIfhIu1cygmM35oE3S8vVfKVEFllbMImImohwhVngoWNak3'


    user_lookup_url = "https://api.twitter.com/2/users/by"

    usernames = "MLP_officiel"

    puts consumer_secret
    puts consumer_key

    consumer = OAuth::Consumer.new(consumer_key, consumer_secret,
                                  :site => 'https://api.twitter.com',
                                  :authorize_path => '/oauth/authenticate',
                                  :debug_output => false
                                  )

    def get_request_token(consumer)
      request_token = consumer.get_request_token()
      return request_token
    end

    def get_user_authorization(request_token)
      puts "Follow this URL to have a user authorize your app: #{request_token.authorize_url()}"
      puts "Enter PIN: "
      pin = gets.strip
      return pin
    end

    def obtain_access_token(consumer, request_token, pin)
      token = request_token.token
      token_secret = request_token.secret
      hash = { :oauth_token => token, :oauth_token_secret => token_secret }
      request_token  = OAuth::RequestToken.from_hash(consumer, hash)

      # Get access token
      access_token = request_token.get_access_token({:oauth_verifier => pin})
      return access_token
    end

    query_params = {
      "usernames": usernames,
      # "expansions": "pinned_tweet_id",
      #{}"tweet.fields": "attachments,author_id,conversation_id,created_at,entities,geo,id,in_reply_to_user_id,lang",
      # "user.fields": "name"
    }

    def user_lookup(url, oauth_params, query_params)
      options = {
          :method => :get,
          headers: {
            "User-Agent": "v2UserLookupRuby"
          },
          params: query_params
      }
      request = Typhoeus::Request.new(url, options)
      oauth_helper = OAuth::Client::Helper.new(request, oauth_params.merge(:request_uri => url))
      request.options[:headers].merge!({"Authorization" => oauth_helper.header}) # Signs the request
      response = request.run
      return response
    end

    # PIN-based OAuth flow - Step 1
    request_token = get_request_token(consumer)
    puts "step 1 done"
    # PIN-based OAuth flow - Step 2
    pin = get_user_authorization(request_token)
    puts "step 2 done"
    # PIN-based OAuth flow - Step 3
    access_token = obtain_access_token(consumer, request_token, pin)
    puts "step 2.1 done"

    oauth_params = {:consumer => consumer, :token => access_token}
    puts "step 2.2 done"

    response = user_lookup(user_lookup_url, oauth_params, query_params)
    puts "step 2.3 done"
    puts response.code, JSON.pretty_generate(JSON.parse(response.body))
    puts "step 3 done"

  end
end
