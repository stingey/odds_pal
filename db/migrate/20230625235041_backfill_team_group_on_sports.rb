# frozen_string_literal: true

class BackfillTeamGroupOnSports < ActiveRecord::Migration[7.0]
  def change
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

    golf_sports = ['Masters Tournament Winner','PGA Championship Winner','The Open Winner','US Open Winner']
    golf_sports.each do |sport|
      Sport.find_by(title: sport).update(team_group: 'GOLF')
    end

    sport = Sport.find_by(title: 'WNBA')
    sport.update(team_group: 'WTA')
  end
end
