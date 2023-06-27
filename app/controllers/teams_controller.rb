# frozen_string_literal: true

class TeamsController < ApplicationController
  def index
    sports = current_user.sports
    teams = sports.flat_map(&:teams)
    followed_teams = current_user.teams
    teams -= followed_teams
    @teams_hash = teams.group_by(&:sport_group)
    @followed_teams_hash = followed_teams.group_by(&:sport_group)
  end
end
