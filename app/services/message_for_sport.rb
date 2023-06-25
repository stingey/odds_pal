# frozen_string_literal: true

class MessageForSport
  def initialize(user:, sport:)
    @user = user
    @sport = sport
  end

  def message
    next_24_hour_matches.flat_map do |match|
      money_lines = money_lines_for_match(match)
      money_lines_strings_for_match(money_lines)
    end.join("\r\n")
  end

  private

  def next_24_hour_matches
    response = OddsApi.new.odds_for_sport(@sport)
    JSON.parse(response.body).select do |match|
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
