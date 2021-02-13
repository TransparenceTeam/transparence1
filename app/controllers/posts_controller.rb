class PostsController < ApplicationController
  def index
    @tweets = policy_scope(Tweet.all)
  end
end
