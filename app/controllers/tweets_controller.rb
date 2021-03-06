class TweetsController < ApplicationController
  before_action :set_tweet, :set_post
  skip_before_action :authenticate_user!, only: [:index]

  def index
    # add this for the feed: order(id: "DESC")
    @tweets = policy_scope(Tweet.all.order(id: "ASC") )
    @posts = policy_scope(Post.all)
    @politicians = policy_scope(Politician.all)
    @policy_areas = policy_scope(PolicyArea.all)
    @project_laws = policy_scope(ProjectLaw.all)
    @project_laws_tags = @project_laws.map {|project_law| { title: "#{project_law.name[0..20]}...", value: project_law.name, id: project_law.id} }.to_json
    @political_parties = policy_scope(PoliticalParty.all)
    @political_group = policy_scope(PoliticalGroup.all)
    @tweet = Tweet.new
    @post = Post.new
    @match = Match.new
  end

  def new
    @match = Match.new
    authorize @match
  end

  def create
    # raise
    # @match.post_id = post.id
    # @match.user = current_user
    # @match = Match.create(user: current_user, match: params[:match_params])
    @post = Post.find(params[:post_id])
    @match = Match.new(match_params)
    @match.post = @match

    # @match.post_ids = @post
    # @post.user = current_user
    # @tweet.user = current_user
    authorize @match

    #if @tweet.save
      #redirect_to tweets_path
    #else
      #render :new
    #end
  end

  def edit
    authorize @tweet
  end

  def update
    if @tweet.update!(is_relevant?: params[:is_relevant])

      if @tweet.is_relevant?
        Post.create(user: current_user, tweet: @tweet)
      end

      redirect_to tweets_path, notice: "tweet relevant"
    else
      render "edit"
    end
    authorize @tweet
  end

  private

  def match_params
    params.require(:match).permit(:post_id, :policy_area_id, :project_law_id)
  end

  def tweet_params
    params.require(:tweet).permit(:is_relevant?)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id]) if params[:id]
  end

  def set_post
    @post = Post.find(params[:id]) if params[:id]
  end

  def set_match
    @match = Match.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:tweet_id, :user_id)
  end
end
