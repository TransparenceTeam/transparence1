class PoliticiansController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @politician = Politician.find(params[:id])
    @policy_areas = policy_scope(PolicyArea.all)
    @posts = policy_scope(Post.all)
    @tweets = policy_scope(Tweet.all)
    @politicians = policy_scope(Politician.all)
    @political_parties = policy_scope(PoliticalParty.all)
    @matches = policy_scope(Match.all)
    @project_laws = policy_scope(ProjectLaw.all)
    @political_group = policy_scope(PoliticalGroup.all)
    authorize @politician
  end
end
