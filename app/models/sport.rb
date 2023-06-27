# frozen_string_literal: true

class Sport < ApplicationRecord
  has_many :user_favorites, dependent: :destroy
  has_many :users, through: :user_favorites
  # has_many :teams, primary_key: :team_group, foreign_key: :sport_group, dependent: :nullify, inverse_of: :sports
  has_many :team_sports, dependent: :destroy
  has_many :teams, through: :team_sports

  scope :active, -> { where(active: true) }
  scope :with_rank, -> { where.not(popularity_rank: nil) }
end
