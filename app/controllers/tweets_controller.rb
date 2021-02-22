class TweetsController < ApplicationController

  def index
    @tweets = policy_scope(Tweet.all)
  end


  def new
    @tweets = Tweet.new
  end

  def create
  end

  def update
  end

  private

  def post_params
    params.require(:post).permit(:username, :ref, :content, :date, :politician_id)
  end

end
