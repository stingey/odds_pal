class CreateSports < ActiveRecord::Migration[7.0]
  def change
    create_table :sports do |t|
      t.string :key, null: false
      t.string :group, null: false
      t.string :title, null: false
      t.string :description, null: false
      t.boolean :active, null: false, default: true
      t.boolean :has_outrights, null: false, default: false
      t.bigint :popularity_rank

      t.timestamps
    end
  end
end
