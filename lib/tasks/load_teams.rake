# frozen_string_literal: true

require 'csv'

namespace :teams do
  desc 'This task loads teams for sports'
  task load_mlb: :environment do
    teams_array = CSV.read('lib/mlb_teams.csv')
    teams_array.each do |team|
      team = Team.find_or_create_by(name: team.last, location: team.first, sport_group: 'MLB')
      Sport.where(team_group: 'MLB').each do |sport|
        team.team_sports.create(sport:)
      end
    end
  end

  task load_nba: :environment do
    teams_array = CSV.read('lib/nba_teams.csv')
    teams_array.each do |team|
      team = Team.find_or_create_by(name: team.last, location: team.first, sport_group: 'NBA')
      Sport.where(team_group: 'NBA').each do |sport|
        team.team_sports.create(sport:)
      end
    end
  end
end
