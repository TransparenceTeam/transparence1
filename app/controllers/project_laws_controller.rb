class ProjectLawsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @project_laws = policy_scope(ProjectLaw)
    @project_laws_tags = @project_laws.map {|project_law| { value: project_law.name, id: project_law.id}.to_json }
    @votes = policy_scope(Vote)
    @deputies = policy_scope(Deputy)
    @political_groups = policy_scope(PoliticalGroup)
  end


end

