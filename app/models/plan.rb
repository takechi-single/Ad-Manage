class Plan < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :media
  belongs_to :target
  belongs_to :item

  belongs_to_active_hash :target, optional: true
  belongs_to_active_hash :media, optional: true

  with_options presence: true do
    validates :when
    validates :where
    validates :target_id
    validates :media_id
    validates :how_much, numericality: { only_integer: true, message: 'is invalid. Input half-width characters.' }
  end
end
