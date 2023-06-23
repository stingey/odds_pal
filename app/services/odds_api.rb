# frozen_string_literal: true

class OddsApi
  # # include HTTParty
  # base_uri Rails.application.credentials.the_odds_api.base_uri

  # def initialize
  #   @api_key = Rails.application.credentials.the_odds_api.api_key
  # end

  # def all_active_sports
  #   Rails.cache.fetch('active_sports', expires_in: 23.hours) do
  #     self.class.get("/v4/sports?apiKey=#{@api_key}&all=false").to_json
  #   end
  # end

  # def all_sports
  #   self.class.get("/v4/sports?apiKey=#{@api_key}&all=true")
  # end

  # def odds_for_sport(sport)
  #   Rails.cache.fetch("/sports/#{sport.key}/odds", expires_in: 23.hours) do
  #     self.class.get("/v4/sports/#{sport.key}/odds/?apiKey=#{@api_key}&regions=us&oddsFormat=american&bookmakers=draftkings").to_json
  #   end
  # end
end
