# frozen_string_literal: true

class SportsController < ApplicationController
  def index
    sports = Sport.all
    @favorited_sports = Sport.joins(:user_favorites).where(user_favorites: { user_id: User.first.id }).distinct
    @sports = sports - @favorited_sports
  end
end
