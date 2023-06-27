# frozen_string_literal: true

class Team < ApplicationRecord
  # belongs_to :sport_group, primary_key: 'group', class_name: 'Sport'
  # belongs_to :sport_group, primary_key: 'group', class_name: 'Sport'
  # has_and_belongs_to_many :sports, primary_key: 'group'
  # has_many :sports
  # has_many :sports, primary_key: :sport_group, foreign_key: :team_group, dependent: :nullify, inverse_of: :teams
  has_many :team_sports, dependent: :destroy

  validates :name, :location, presence: true
end
