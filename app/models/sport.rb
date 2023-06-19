# frozen_string_literal: true

class Sport < ApplicationRecord
  has_many :user_favorites, dependent: :nullify
  has_many :users, through: :user_favorites
end
