class Item < ActiveRecord::Base
  with_options presence: true do
    validates :name
    validates :text
    validates :price, numericality: { only_integer: true, message: 'is invalid. Input half-width characters.' }
    validates :relese_date
    validates :image
  end

  belongs_to :user, optional: true
  has_one_attached :image
  has_many :manages, dependent: :destroy
  has_many :plan, dependent: :destroy

  def self.search(search)
    if search != ''
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
