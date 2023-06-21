# frozen_string_literal: true

class TwilioApi
  def initialize(user:, message: )
    @user = user
    @message = message
  end

  def send_message
    account_sid = Rails.application.credentials.twilio.account_sid
    auth_token = Rails.application.credentials.twilio.auth_token
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    # @client.messages.create(body: @message, from: 'whatsapp:+14155238886', to: "whatsapp:+#{@user.phone_number}")
    @client.messages.create(body: @message, from: 'whatsapp:+14155238886', to: "whatsapp:+12082018898")
  end
end
