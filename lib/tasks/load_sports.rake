# frozen_string_literal: true

namespace :sports do
  desc 'This task loads sports'
  task load: :environment do
    response = OddsApi.new.all_sports
    JSON.parse(response.body).each do |sport|
      sport_offering = Sport::CURRENT_OFFERINGS.find { |offered_sport| sport['title'].include?(offered_sport) }
      next if sport_offering.blank?

      Sport.find_or_create_by(sport.merge(team_group: sport_offering))
    end
    Sport.find_by(title: 'WNBA').destroy
  end
end
