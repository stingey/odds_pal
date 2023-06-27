# frozen_string_literal: true

class AddTeamGroupToSports < ActiveRecord::Migration[7.0]
  def change
    add_column :sports, :team_group, :string
  end
end
