# frozen_string_literal: true

class SendLineTextToUserJob < ApplicationJob
  queue_as :default

  def perform(user)
    user.send_message
  end
end
