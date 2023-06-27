# frozen_string_literal: true

class TeamSport < ApplicationRecord
  belongs_to :team
  belongs_to :sport
end
