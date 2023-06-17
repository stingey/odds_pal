# frozen_string_literal: true

class TwilioApi
  def initialize(user:, message:)
    @user = user
    @message = message
  end
  account_sid = Rails.application.credentials.twilio.account_sid
  auth_token = Rails.application.credentials.twilio.auth_token
  @client = Twilio::REST::Client.new(account_sid, auth_token)

  message = @client.messages.create(
    body: 'Your appointment is coming up on July 21 at 3PM',
    from: 'whatsapp:+14155238886',
    to: 'whatsapp:+18012003673'
  )

  puts message.sid
end
