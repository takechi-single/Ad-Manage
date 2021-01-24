class Manage < ApplicationRecord
  belongs_to :user
  belongs_to :item

  with_options presence: true do
    validates :sale_date
    validates :profit, numericality: { only_integer: true, message: 'is invalid. Input half-width characters.' }
  end
end
