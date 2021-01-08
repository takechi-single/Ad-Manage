class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :text
    validates :price, numericality: { only_integer: true, message: 'is invalid. Input half-width characters.' }
    validates :relese_date
    validates :image
  end

  belongs_to :user, optional: true
  has_one_attached :image
  has_many :manages
  has_many :plan
end
