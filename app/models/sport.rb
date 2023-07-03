# frozen_string_literal: true

class Sport < ApplicationRecord
  CURRENT_OFFERINGS = %w[MLB ATP NBA WTA].freeze

  has_many :user_favorites, dependent: :destroy
  has_many :users, through: :user_favorites
  has_many :team_sports, dependent: :destroy
  has_many :teams, through: :team_sports

  validates :key, uniqueness: true

  scope :active, -> { where(active: true) }
  scope :with_rank, -> { where.not(popularity_rank: nil) }
end
