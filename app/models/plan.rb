class Plan < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :media
  belongs_to :target

  validates :media_id, numericality: { other_than: 1 } 
end
