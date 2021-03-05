class MatchesController < ApplicationController

  def new
    raise
    @match = Match.new
    authorize @match
  end

  def create
    @match = Match.new(match_params)
    @match.user = current_user
    authorize @match
    if @match.save
      redirect_to matches_path
    else
      render 'new'
    end
  end

  private

  def match_params
    params.require(:match).permit(:post_id, :policy_area_id, :project_law_id)
  end

end


#tweet_matches create
#new_tweet_match new
