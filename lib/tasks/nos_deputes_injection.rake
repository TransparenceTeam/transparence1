namespace :db do
  desc "nos deputes.fr injection"
  task fetch_api_data: :environment do
    require 'open-uri'
    require 'json'
    require "i18n"
    require_relative 'results_api'
    require "time"


    def project_law_name_cleaning(law)
      new_law = law.gsub("(lecture définitive)", "").gsub("l'ensemble de la ","").gsub("(texte de la commisison mixte paritaire)", "").gsub("(première lecture)","").gsub("(premiere lecture)","").gsub("(deuxième lecture)","").gsub("(nouvelle lecture)","").gsub("(texte de la commission mixte paritaire)","").gsub("l'ensemble du ","").gsub("(lecture défintive)", "")
      up_to_date_law = new_law.capitalize
    end

    def get_year(date)
      date[0..3]
    end


    puts "step 4 done"

    api_results = VoteResults.new
    api_results.execute
    puts "step 5 done"
  end
end
