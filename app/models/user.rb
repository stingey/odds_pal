# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_favorites, dependent: :destroy
  has_many :sports, through: :user_favorites
end
