class ProjectLawsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @project_laws = policy_scope(ProjectLaw)
    @votes = policy_scope(Vote)
    @deputies = policy_scope(Deputy)
    @political_groups = policy_scope(PoliticalGroup)
  end
end

