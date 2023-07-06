# frozen_string_literal: true

class Team < ApplicationRecord
  has_many :team_sports, dependent: :destroy
  has_many :followed_teams, dependent: :destroy

  validates :name, presence: true
end
