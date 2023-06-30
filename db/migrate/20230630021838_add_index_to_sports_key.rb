# frozen_string_literal: true

class AddIndexToSportsKey < ActiveRecord::Migration[7.0]
  def change
    add_index :sports, :key, unique: true
  end
end
