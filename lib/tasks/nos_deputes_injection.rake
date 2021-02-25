namespace :db do
  desc "nos deputes.fr injection"
  task fetch_api_data: :environment do
    require 'open-uri'
    require 'json'
    require "i18n"
    require_relative 'results_api'


    deputies_url = 'https://www.nosdeputes.fr/deputes/json'

    deputies_serialized = URI.open(deputies_url).read
    json_deputies = JSON.parse(deputies_serialized)

    json_deputies['deputes'].each do |group|
      unless PoliticalGroup.exists?(ref: group['depute']['groupe_sigle'])
        if group['depute']['parti_ratt_financier'].length.positive?
          new_group = PoliticalGroup.create!(
            ref: group['depute']['groupe_sigle'],
            name: group['depute']['parti_ratt_financier']
          )
          puts "Group #{new_group.ref} (id #{new_group.id}) has been created"
        end
      end
    end

    puts "step 1 done"

    json_deputies['deputes'].each do |deputy|
      if !deputy['depute']['groupe_sigle'].nil?
        deputy_string = I18n.transliterate(deputy['depute']['nom']).gsub("-", " ").gsub("'", " ")
        word_list = []
        deputy_list_name = deputy_string.split(" ")
        deputy_list_name.each do |deputy_word|
          word_list << deputy_word.capitalize
        end
        new_deputy_name = word_list.join(" ")

        unless Deputy.exists?(name: new_deputy_name)
          puts deputy['depute']['groupe_sigle']
          new_deputy = Deputy.create!(
            name: new_deputy_name,
            first_name: deputy['depute']['prenom'],
            last_name: deputy['depute']['nom_de_famille'],
            url_description: deputy['depute']['url_an'],
            political_group_id: PoliticalGroup.where(ref: deputy['depute']['groupe_sigle']).first.id
          )
          puts "Depute #{new_deputy.name} (id #{new_deputy.id}) has been created"
        end
      end
    end

    puts "step 2 done"

    deputies = Deputy.all
    deputies.each do |deputy|
      if deputy.last_name.include? "(de)"
        new_name = deputy.last_name.gsub(" (de)", "")
        deputy_last_name = "de #{new_name}"
      elsif deputy.last_name.include? "(De)"
        new_name = deputy.last_name.gsub(" (De)", "")
        deputy_last_name = "de #{new_name}"
      elsif deputy.last_name.include? "O'"
        deputy_last_name = deputy.last_name.gsub("O'", "o ")
      elsif deputy.last_name.include? "-Le Nabour"
        deputy_last_name = deputy.last_name.gsub("-Le Nabour", "")
      elsif deputy.last_name.include? "'"
        deputy_last_name = deputy.last_name.gsub("'", " ")
      elsif deputy.last_name.include? "ö"
        deputy_last_name = deputy.last_name.gsub("ö", "oe")
      else
        deputy_last_name = deputy.last_name
      end

      if deputy.first_name.include? "M'"
        deputy_first_name = deputy.first_name.gsub("M'", "M ")
      else
        deputy_first_name = deputy.first_name
      end

      deputy_url = "https://www.nosdeputes.fr/#{I18n.transliterate(deputy_first_name.to_s.gsub(' ', '-'))}-#{I18n.transliterate(deputy_last_name.to_s.gsub(' ', '-'))}/votes/json"
      deputy_serialized = URI.open(deputy_url).read
      json_deputy = JSON.parse(deputy_serialized)
      json_deputy['votes'].each do |deputy_vote|
        if !deputy_vote['vote']['scrutin']['titre'].nil? && !deputy_vote['vote']['scrutin']['numero'].nil?
          if deputy_vote['vote']['scrutin']['titre'].include? "lecture définitive"
            unless ProjectLaw.exists?(scrutin: deputy_vote['vote']['scrutin']['numero'])

              new_project_law = ProjectLaw.create!(
                scrutin: deputy_vote['vote']['scrutin']['numero'],
                name: deputy_vote['vote']['scrutin']['titre'],
                url: deputy_vote['vote']['scrutin']['url_nosdeputes_api'],
                date: deputy_vote['vote']['scrutin']['date'],
                position_law: deputy_vote['vote']['scrutin']['sort'],
                sum: deputy_vote['vote']['scrutin']['nombre_votants'],
                sum_for: deputy_vote['vote']['scrutin']['nombre_pours'],
                sum_against: deputy_vote['vote']['scrutin']['nombre_contres'],
                sum_abstention: deputy_vote['vote']['scrutin']['nombre_abstentions'],
                owner: deputy_vote['vote']['scrutin']['demandeurs'][0]['demandeur']
              )
              puts "scrutin nb  #{new_project_law.scrutin} (id #{new_project_law.id}) has been created"
            end
          end
        end
      end
    end

    puts "step 3 done"

    votes = ProjectLaw.all
    votes.each do |vote|
      votes_serialized = URI.open(vote.url).read
      votes_deputies = JSON.parse(votes_serialized)
      votes_deputies['votes'].each do |scrutin|

        deputy_scrutin_api = scrutin['vote']['parlementaire_slug'].to_s.gsub("-", " ")
        deputy_scrutin = deputy_scrutin_api.split(" ")
        new_list = []
        deputy_scrutin.each do |dep|
          new_list << dep.capitalize()
        end

        deputy_name = new_list.join(" ")

        if deputy_name == 'Christine Cloarec'
          deputy_name = 'Christine Cloarec Le Nabour'
        elsif deputy_name == 'Sandrine Moerch'
          deputy_name = 'Sandrine Morch'
        end

        if !scrutin['vote']['position'].nil?
          unless Vote.exists?(deputy_id: Deputy.where(name: deputy_name).first.id) &&
            Vote.exists?(project_law_id: ProjectLaw.where(scrutin: scrutin['vote']['scrutin']['numero']).first.id)

            new_vote = Vote.create!(
              deputy_id: Deputy.where(name: deputy_name).first.id,
              project_law_id: ProjectLaw.where(scrutin: scrutin['vote']['scrutin']['numero']).first.id,
              position: scrutin['vote']['position']
            )
            puts "Vote id #{new_vote.id} has been created"
          end
        end
      end
    end
    puts "step 4 done"

    api_results = VoteResults.new
    api_results.execute
    puts "step 5 done"
  end
end
