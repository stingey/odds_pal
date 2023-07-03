# frozen_string_literal: true

class SportsController < ApplicationController
  def index
    sports = Sport.all
    @favorited_sports = Sport.joins(:user_favorites).where(user_favorites: { user_id: User.first.id }).distinct
    sports -= @favorited_sports
    @sports_hash = sports.group_by(&:team_group)
  end
end
