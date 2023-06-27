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

    # @client.messages.create(body: "hi tell spenser if you get this", from: 'whatsapp:+14155238886', to: "whatsapp:+12084972476")
    # @client.messages.create(body: "hi tell spenser if you get this", from: 'whatsapp:+14155238886', to: "whatsapp:+18017030506")
    # @client.messages.create(body: "hi tell spenser if you get this", from: 'whatsapp:+14155238886', to: "whatsapp:+18012003673")
    # @client.messages.create(body: @message, from: 'whatsapp:+14155238886', to: "whatsapp:+1#{@user.phone_number}")
    @client.messages.create(body: @message, from: 'whatsapp:+12087416193', to: "whatsapp:+1#{@user.phone_number}")
  end
end
