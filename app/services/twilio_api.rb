# frozen_string_literal: true

class TwilioApi
  def initialize(user:, message:)
    @user = user
    @message = message
  end

  def send_message
    account_sid = Rails.application.credentials.twilio.account_sid
    auth_token = Rails.application.credentials.twilio.auth_token
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @client.messages.create(body: @message, from: '+12087416193', to: "+1#{@user.phone_number}")
  end
end
