class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,               null: false
      t.string :text,               null: false
      t.string :price,              null: false
      t.date :relese_date,          null: false
      t.references :user,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
