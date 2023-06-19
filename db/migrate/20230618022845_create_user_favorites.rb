class CreateUserFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :user_favorites do |t|
      t.references :user
      t.references :sport

      t.timestamps
    end
  end
end
