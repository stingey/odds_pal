# frozen_string_literal: true

class FollowedTeam < ApplicationRecord
  belongs_to :user
  belongs_to :team
end
