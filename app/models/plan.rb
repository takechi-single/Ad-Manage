class Plan < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :media
  belongs_to :target
  belongs_to :item

  validates :target_id, numericality: { other_than: 1 }
  validates :media_id, numericality: { other_than: 1 }

  belongs_to_active_hash :target, optional: true
  belongs_to_active_hash :media, optional: true
end
