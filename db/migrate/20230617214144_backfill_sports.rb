class BackfillSports < ActiveRecord::Migration[7.0]
  def change
    OddsApi.new.all_sports.each do |sport|
      Sport.create(sport)
    end
  end
end
