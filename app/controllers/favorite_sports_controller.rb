# frozen_string_literal: true

class FavoriteSportsController < ApplicationController
  def create
    sport = Sport.find_by(title: params[:title])
    UserFavorite.create(user: current_user, sport:)
    set_sports

    respond_to :turbo_stream
  end

  def destroy
    sport = Sport.find(params[:id])
    user_favorite = UserFavorite.find_by(user: current_user, sport:)
    user_favorite.destroy
    set_sports

    respond_to :turbo_stream
  end

  private

  def set_sports
    sports = Sport.all
    @favorited_sports = Sport.joins(:user_favorites).where(user_favorites: { user_id: current_user.id }).distinct
    sports -= @favorited_sports
    @sports_hash = sports.group_by(&:team_group)
  end
end
