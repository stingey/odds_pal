# frozen_string_literal: true

class GetOddsForUserPicksJob < ApplicationJob
  queue_as :default

  def perform
    puts "\n\n\n\n\n"
    puts 'hi'
    puts "\n\n\n\n\n"
  end
end
