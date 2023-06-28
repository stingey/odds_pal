# frozen_string_literal: true

namespace :sports do
  desc 'This task loads sports'
  task load: :environment do
    response = OddsApi.new.all_sports
    JSON.parse(response.body).each do |sport|
      Sport.create(sport)
    end
  end

  desc 'Add rank to select sports'
  task rank: :environment do
    groups = %w[Tennis Golf]
    titles = [
      'MLB', 'MLB Preseason', 'MLB World Series Winner', 'MLB Preseason', 'MLB World Series Winner', 'NFL', 'NFL Preseason',
      'NFL Suber Bowl Winner', 'NBA', 'NBA Championship Winner', 'NBA Preseason', 'WNBA'
    ]
    Sport.where(group: groups).update_all(popularity_rank: 1) # rubocop:disable Rails/SkipsModelValidations
    Sport.where(title: titles).update_all(popularity_rank: 1) # rubocop:disable Rails/SkipsModelValidations
    add_team_group
  end

  # rubocop:disable Rails/SkipsModelValidations
  def add_team_group # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
    sports = Sport.where('title LIKE ?', '%MLB%')
    sports.update_all(team_group: 'MLB')

    sports = Sport.where('title LIKE ?', 'NBA%')
    sports.update_all(team_group: 'NBA')

    sports = Sport.where('title LIKE ?', '%NFL%')
    sports.update_all(team_group: 'NFL')

    sports = Sport.where('title LIKE ?', '%ATP%')
    sports.update_all(team_group: 'ATP')

    sports = Sport.where('title LIKE ?', '%WTA%')
    sports.update_all(team_group: 'WTA')

    golf_sports = ['Masters Tournament Winner', 'PGA Championship Winner', 'The Open Winner', 'US Open Winner']
    golf_sports.each do |sport|
      Sport.find_by(title: sport).update(team_group: 'GOLF')
    end

    sport = Sport.find_by(title: 'WNBA')
    sport.update(team_group: 'WTA')
  end
  # rubocop:enable Rails/SkipsModelValidations
end
