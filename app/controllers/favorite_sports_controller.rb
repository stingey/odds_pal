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
    sports = Sport.with_rank
    @favorited_sports = Sport.joins(:user_favorites).where(user_favorites: { user_id: current_user.id }).distinct
    @sports = sports - @favorited_sports
  end
end
