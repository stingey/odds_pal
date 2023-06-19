# frozen_string_literal: true

class FavoriteSportsController < ApplicationController
  def create
    sport = Sport.find_by(title: params[:title])
    UserFavorite.create(user: User.first, sport:)
    set_sports

    respond_to :turbo_stream
  end

  def destroy
    sport = Sport.find(params[:id])
    user_favorite = UserFavorite.find_by(user: User.first, sport:)
    user_favorite.destroy
    set_sports

    respond_to :turbo_stream
  end

  private

  def set_sports
    sports = Sport.all
    @favorited_sports = Sport.joins(:user_favorites).where(user_favorites: { user_id: User.first.id }).distinct
    @sports = sports - @favorited_sports
  end
end
