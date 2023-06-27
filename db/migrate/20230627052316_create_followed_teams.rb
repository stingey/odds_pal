# frozen_string_literal: true

class CreateFollowedTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :followed_teams do |t|
      t.references :user
      t.references :team

      t.timestamps
    end
  end
end
