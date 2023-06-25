# frozen_string_literal: true

class Team < ApplicationRecord
  # belongs_to :sport_group, primary_key: 'group', class_name: 'Sport'
  # belongs_to :sport_group, primary_key: 'group', class_name: 'Sport'
  # has_and_belongs_to_many :sports, primary_key: 'group'

  validates :name, :location, presence: true
end
