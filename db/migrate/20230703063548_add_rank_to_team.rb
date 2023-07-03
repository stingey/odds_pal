# frozen_string_literal: true

class AddRankToTeam < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :rank, :bigint
  end
end
