class PoliticiansController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @politician = Politician.find(params[:id])
    authorize @politician
    # @tweet = @politician.tweet_id
  end
end
