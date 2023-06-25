# frozen_string_literal: true

class Sport < ApplicationRecord
  has_many :user_favorites, dependent: :destroy
  has_many :users, through: :user_favorites

  scope :active, -> { where(active: true) }
  scope :with_rank, -> { where.not(popularity_rank: nil) }
end
