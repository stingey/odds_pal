# frozen_string_literal: true

module Odds
  extend ActiveSupport::Concern

  def full_string_of_money_lines_for_sport
    next_24_hour_matches.flat_map do |match|
      money_lines = money_lines_for_match(match)
      money_lines_strings_for_match(money_lines)
    end.join("\r\n")
  end

  def next_24_hour_matches
    JSON.parse(OddsApi.new.odds_for_sport(self)).select do |match|
      time = Time.zone.parse(match['commence_time'])
      time.future? && time - Time.now.utc < 86_400
    end
  end

  def money_lines_for_match(match)
    match['bookmakers'].first&.dig('markets')&.select do |market_hash|
      market_hash['key'] == 'h2h'
    end
  end

  def money_lines_strings_for_match(money_lines)
    money_lines.flat_map do |money_line_hash|
      money_line_hash['outcomes'].flat_map do |outcome|
        "#{outcome['name']}: #{odds_with_plus_or_minus(outcome['price'])}"
      end
    end.join(' | ')
  end

  def odds_with_plus_or_minus(price)
    return price if price.negative?

    "+#{price}"
  end
end


# sport = Sport.find_by(key: 'baseball_mlb')
# sport.full_string_of_money_lines_for_sport
# sport.next_24_hour_matches.map{|hash| "#{hash['home_team']} vs #{hash['away_team']}"}
