class TweetsController < ApplicationController

  before_action :set_tweet

  def index
    # add this for the feed: order(id: "DESC")
    @tweets = policy_scope(Tweet.all)
    @matches = policy_scope(Match.all)
    @politicians = policy_scope(Politician.all)
    @policy_areas = policy_scope(PolicyArea.all)
    @project_laws = policy_scope(ProjectLaw.all)
    @project_laws_tags = @project_laws.map {|project_law| { title: "#{project_law.name[0..20]}...", value: project_law.name, id: project_law.id} }.to_json
    @political_parties = policy_scope(PoliticalParty.all)
    @political_group = policy_scope(PoliticalGroup.all)
  end

  def new
    authorize @tweet
    @tweet = current_user.Tweet.new
  end

  def create
    @tweet = current_user.Tweet.new(tweet_params)
    authorize @tweet

    if @tweet.save
      redirect_to @tweets
    else
      render :new
    end
  end

  def edit
    authorize @tweet
  end

  def update
    authorize @tweet
    if @tweet.update(tweet_params)
      redirect_to @tweet
    else
      render :edit
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:is_relevant)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id]) if params[:id]
  end
end
