class Plan < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :media

  validates :media_id, numericality: { other_than: 1 } 
end
