class Item < ApplicationRecord
  with_options presence: true do
    validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
    validates :text, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
    validates :price, numericality: { only_integer: true, message: "is invalid. Input half-width characters." }
    validates :relese_date
    validates :image
  end

  belongs_to :user
  has_one_attached :image
end
