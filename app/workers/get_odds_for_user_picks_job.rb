# frozen_string_literal: true

class GetOddsForUserPicksJob < ApplicationJob
  queue_as :default

  def perform
    arr = %w[red blue yellow green orange teal black]
    User.first.update(first_name: arr.sample)
  end
end
