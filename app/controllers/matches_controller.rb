class MatchesController < ApplicationController
  before_action :authenticate_user!

  def create

    @match = Match.new(match_params)
    @match.user = current_user
    authorize @match
    @match.save
    redirect_to tweets_path
  end

  private

  def match_params
    params.require(:match).permit(:post_id, :policy_area_id, :project_law_id)
  end

end


#tweet_matches create
#new_tweet_match new
