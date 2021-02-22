namespace :db do
  desc "nos deputes.fr injection"
  task fetch_api_data: :environment do

    project_laws = ProjectLaw.all
    votes = Vote.all


    project_laws.each do |law|
      puts law.name
    end




  end
end
