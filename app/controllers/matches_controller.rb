class MatchesController < ApplicationController
  def new
    @match = Match.new
    authorize @match
  end

  def create

  end


end
