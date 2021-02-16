class UserPostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_post, only: [:index]

def index
    @tweets = policy_scope(Tweet.all)
    @posts = policy_scope(Post.all)
  end
end
