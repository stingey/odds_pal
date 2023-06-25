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
  end
end
