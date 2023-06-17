# frozen_string_literal: true

class OddsApi
  include HTTParty
  base_uri Rails.application.credentials.the_odds_api.base_uri

  def initialize
    @api_key = Rails.application.credentials.the_odds_api.api_key
  end

  def all_sports
    self.class.get("/v4/sports?apiKey=#{@api_key}&all=true")
  end
end
