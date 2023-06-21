# frozen_string_literal: true

class GetOddsForUserPicksJob < ApplicationJob
  queue_as :default

  def perform(user)
    Sport.get_odds(user)
  end
end
