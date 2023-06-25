# frozen_string_literal: true

require 'csv'

namespace :teams do
  desc 'This task loads teams for sports'
  task load_mlb: :environment do
    teams_array = CSV.read('lib/mlb_teams.csv')
    teams_array.each do |team|
      Team.find_or_create_by(name: team.last, location: team.first, sport_group: 'MLB')
    end
  end

  task load_nba: :environment do
    teams_array = CSV.read('lib/nba_teams.csv')
    teams_array.each do |team|
      Team.find_or_create_by(name: team.last, location: team.first, sport_group: 'NBA')
    end
  end
end
