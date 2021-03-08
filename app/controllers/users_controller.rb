class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def index
    @posts = Post.where(user: current_user)
    @tweets = policy_scope(Tweet.all)
    @politicians = policy_scope(Politician.all)
    @political_parties = policy_scope(PoliticalParty.all)
    @matches = policy_scope(Match.all)
    @policy_areas = policy_scope(PolicyArea.all)
    @project_laws = policy_scope(ProjectLaw.all)
    @political_groups = policy_scope(PoliticalGroup.all)
  end

  #def score_user
    #render text: 'Thanks for sending a GET request with cURL!'
    #@posts = Tweet.find.last
    #respond_to |format|
    #  format.html
    #  format.json {render json: @posts}
  #end

  private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end

#@posts = policy_scope(Post.joins(:matches).where.not(matches: nil).order(id: "DESC"))
