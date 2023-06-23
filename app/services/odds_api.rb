# frozen_string_literal: true

class OddsApi
  def initialize
    @api_key = Rails.application.credentials.the_odds_api.api_key
    @base_uri = Rails.application.credentials.the_odds_api.base_uri
  end

  def all_active_sports
    Rails.cache.fetch('active_sports', expires_in: 23.hours) do
      Faraday.get("#{@base_uri}/v4/sports?apiKey=#{@api_key}&all=false")
    end
  end

  def all_sports
    Rails.cache.fetch('all_sports', expires_in: 23.hours) do
      Faraday.get("#{@base_uri}/v4/sports?apiKey=#{@api_key}&all=true")
    end
  end

  def odds_for_sport(sport)
    Rails.cache.fetch("/sports/#{sport.key}/odds", expires_in: 23.hours) do
      Faraday.get("#{@base_uri}/v4/sports/#{sport.key}/odds/?apiKey=#{@api_key}&regions=us&oddsFormat=american&bookmakers=draftkings")
    end
  end
end
