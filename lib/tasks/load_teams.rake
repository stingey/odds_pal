# frozen_string_literal: true

require 'csv'

namespace :teams do # rubocop:disable Metrics/BlockLength
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

  task load_atp: :environment do
    players_array = CSV.read('lib/atp_players.csv')
    players_array.each do |player|
      team = Team.find_or_create_by(name: player.first, sport_group: 'ATP')
      Sport.where(team_group: 'ATP').each do |sport|
        team.team_sports.create(sport:)
      end
    end
  end

  task load_wta: :environment do
    players_array = CSV.read('lib/wta_players.csv')
    players_array.each do |player|
      team = Team.find_or_create_by(name: player.first, sport_group: 'WTA')
      Sport.where(team_group: 'WTA').each do |sport|
        team.team_sports.create(sport:)
      end
    end
  end
end
