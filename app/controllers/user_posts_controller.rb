class UserPostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_post, :set_user, only: [:index]

  def index
    @tweets = policy_scope(Tweet.all)
    @posts = policy_scope(Post.all)
    @user_posts = user.favoritors
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
