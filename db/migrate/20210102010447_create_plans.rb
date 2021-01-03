class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.date :when
      t.date :when_by
      t.string :where
      t.string :who
      t.string :with_whom
      t.integer :target_id
      t.integer :media_id
      t.string :why
      t.string :how_many
      t.string :how_much
      t.references   :user,               null: false, foreign_key: true
      t.references   :item,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
