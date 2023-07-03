# frozen_string_literal: true

class FollowedTeamsController < ApplicationController
  def create
    team = Team.find_by(name: params[:name])
    current_user.followed_teams.create(team:)
    set_teams

    respond_to :turbo_stream
  end

  def destroy
    followed_team = FollowedTeam.find_by(user: current_user, team: params[:id])
    followed_team.destroy
    set_teams

    respond_to :turbo_stream
  end

  private

  def set_teams
    sports = current_user.sports
    teams = sports.flat_map(&:teams).uniq
    followed_teams = current_user.teams
    teams -= followed_teams
    @teams_hash = teams.group_by(&:sport_group)
    @followed_teams_hash = followed_teams.group_by(&:sport_group)
  end
end
