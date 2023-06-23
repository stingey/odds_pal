# frozen_string_literal: true

class AddRankToSports < ActiveRecord::Migration[7.0]
  def change
    groups = ['American Football', 'Baseball', 'Basketball', 'Golf', 'Tennis']
    Sport.where(group: groups).each do |sport|
      sport.update(popularity_rank: 1)
    end
  end
end
