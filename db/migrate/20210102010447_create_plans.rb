class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.date :when,               null: false
      t.string :where,            null: false
      t.string :target_id,       null: false
      t.string :media_id,        null: false
      t.string :how_much,         null: false
      t.references   :user,       null: false, foreign_key: true
      t.references   :item,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
