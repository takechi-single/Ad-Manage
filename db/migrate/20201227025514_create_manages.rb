class CreateManages < ActiveRecord::Migration[6.0]
  def change
    create_table :manages do |t|
      t.integer      :media1_id,          null: false
      t.integer      :media2_id,          null: false
      t.integer      :media3_id,          null: false
      t.integer      :media4_id,          null: false
      t.references   :user,               null: false, foreign_key: true
      t.references   :item,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
