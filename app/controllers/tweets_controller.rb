class TweetsController < ApplicationController

  before_action :set_tweet

  def index
    # add this for the feed: order(id: "DESC")
    @tweets = policy_scope(Tweet.all.order(id: "DESC"))
    @matches = policy_scope(Match.all)
    @politicians = policy_scope(Politician.all)
    @policy_areas = policy_scope(PolicyArea.all)
    @project_laws = policy_scope(ProjectLaw.all)
    @project_laws_tags = @project_laws.map {|project_law| { title: "#{project_law.name[0..20]}...", value: project_law.name, id: project_law.id} }.to_json
    @political_parties = policy_scope(PoliticalParty.all)
    @political_group = policy_scope(PoliticalGroup.all)
    @tweet = Tweet.new
    @post = Post.new
    @new_post = current_user.posts.build
    @user = current_user
  end

  def new
    @tweet = Tweet.new
    authorize @tweet
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.post_ids = @post
    # @post.user = current_user
    # @tweet.user = current_user
    authorize @tweet

    if @tweet.save
      redirect_to tweets_path
    else
      render :new
    end
  end

  def edit
    authorize @tweet
  end

  def update
    authorize @tweet
    if @tweet.update(post_params)
      redirect_to @tweets
    else
      render :index
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:is_relevant?)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id]) if params[:id]
  end

  def set_post
    @post = Post.find(params[:id]) if params[:id]
  end

  def post_params
    params.require(:post).permit(:tweet_id, :user_id)
  end
end
