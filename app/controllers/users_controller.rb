class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = Post.where(user: current_user)
    @tweets = policy_scope(Tweet.all)
    @politicians = policy_scope(Politician.all)
    @political_parties = policy_scope(PoliticalParty.all)
    @matches = policy_scope(Match.all)
    @policy_areas = policy_scope(PolicyArea.all)
    @project_laws = policy_scope(ProjectLaw.all)
    @political_groups = policy_scope(PoliticalGroup.all)
    authorize @user
    gon.posts = @posts.count
  end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
