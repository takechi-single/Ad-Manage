class CreateManages < ActiveRecord::Migration[6.0]
  def change
    create_table :manages do |t|
      t.integer      :profit,          null: false
      t.references   :user,               null: false, foreign_key: true
      t.references   :item,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
