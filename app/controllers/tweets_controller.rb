class TweetsController < ApplicationController

  def index
    @tweets = policy_scope(Tweet.all)
    @matches = policy_scope(Match.all)
    @politicians = policy_scope(Politician.all)
    @policy_areas = policy_scope(PolicyArea.all)
    @project_laws = policy_scope(ProjectLaw.all)
    @political_parties = policy_scope(PoliticalParty.all)
    @political_group = policy_scope(PoliticalGroup.all)
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
    params.require(:post).permit(:username, :content, :avatar_https, :date, :tweet_id, :politician_id)
  end

end
