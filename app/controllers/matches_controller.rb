class MatchesController < ApplicationController
  before_action :authenticate_user!

  def create
    @match = Match.new(match_params)
    @match.user = current_user
    authorize @match

    @match.save
    if @match.save
      Tweet.find(Post.where(id: @match.post_id)[0].tweet_id).update!(is_selected?: true)
    end
    redirect_to "#{tweets_path}#tweet#{Tweet.find(Post.where(id: @match.post_id)[0].tweet_id).id + 1}", notice: "tweet relevant"

  end

  private

  def match_params
    params.require(:match).permit(:post_id, :policy_area_id, :project_law_id)
  end
end
