# frozen_string_literal: true

class UserFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :sport

  after_destroy :remove_followed_teams

  def remove_followed_teams
    return if user.sports.exists?(team_group: sport.team_group)

    user.followed_teams.where(team_id: sport.teams.pluck(:id)).destroy_all
  end
end
