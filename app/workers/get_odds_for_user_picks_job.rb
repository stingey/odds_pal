# frozen_string_literal: true

class GetOddsForUserPicksJob < ApplicationJob
  queue_as :default

  def perform
    Rails.logger.error("\n\n\n\nhello\n\n\n\n")
  end
end
