class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :toggle_favorite], raise: false
  before_action :set_post, only: [:new, :create, :edit, :update, :destroy]
  respond_to :js, :json, :html

  def index
    @tweets = policy_scope(Tweet.all)
    @politicians = policy_scope(Politician.all)
    @political_parties = policy_scope(PoliticalParty.all)
    @matches = policy_scope(Match.all)
    @policy_areas = policy_scope(PolicyArea.all)
    @project_laws = policy_scope(ProjectLaw.all)
    @political_groups = policy_scope(PoliticalGroup.all)

    if params[:name].present?
      @posts = policy_scope(Post.joins(:matches).where.not(matches: nil).order(id: "DESC")).search_by_politico(params[:name])
    else
      @posts = policy_scope(Post.joins(:matches).where.not(matches: nil).order(id: "DESC"))
    end

    # @favorite_posts = current_user.favorited_by_type('Post')

  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    authorize @post
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
    authorize @post
  end

  def update
    @post.update(post_params)
    authorize @post
  end

  def destroy
    @post.destroy
    authorize @post
    redirect_to posts_path
  end

  def toggle_favorite
    @post = Post.find(params[:id])
    current_user.favorited?(@post) ? current_user.unfavorite(@post) : current_user.favorite(@post)
  end

  private

  def post_params
    params.require(:post).permit(:tag, :policy_area, :tweet_id, :user_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
