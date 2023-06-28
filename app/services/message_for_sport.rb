# frozen_string_literal: true

class MessageForSport
  def initialize(user:, sport:)
    @user = user
    @sport = sport
  end

  def message
    next_24_hour_matches_of_followed_teams.flat_map do |match|
      money_lines = money_lines_for_match(match)
      next if money_lines.blank?

      money_lines_strings_for_match(money_lines)
    end.compact_blank&.join("\r\n")
  end

  private

  def next_24_hour_matches
    response = OddsApi.new.odds_for_sport(@sport)
    JSON.parse(response.body).select do |match|
      time = Time.zone.parse(match['commence_time'])
      time.future? && time - Time.now.utc < 86_400
    end
  end

  def next_24_hour_matches_of_followed_teams
    next_24_hour_matches.select do |match|
      followed_teams.any? do |team|
        match['home_team'].include?(team.name) || match['away_team'].include?(team.name)
      end
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

  def followed_teams
    @user.teams.where(sport_group: @sport.team_group).presence ||
      Team.where(sport_group: @sport.team_group)
  end
end
