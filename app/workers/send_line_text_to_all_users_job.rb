# frozen_string_literal: true

class SendLineTextToAllUsersJob < ApplicationJob
  queue_as :default

  def perform
    User.find_each do |user|
      SendLineTextToUserJob.perform_later(user)
    end
  end
end
