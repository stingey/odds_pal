class BackfillSports < ActiveRecord::Migration[7.0]
  def change
    response = OddsApi.new.all_sports
    JSON.parse(response.body).each do |sport|
      Sport.create(sport)
    end
  end
end
