# frozen_string_literal: true

class Sport < ApplicationRecord
  include Odds

  has_many :user_favorites, dependent: :nullify
  has_many :users, through: :user_favorites

  scope :active, -> { where(active: true) }
  scope :with_rank, -> { where.not(popularity_rank: nil) }

  def self.get_odds(user)
    user.sports
  end
end
