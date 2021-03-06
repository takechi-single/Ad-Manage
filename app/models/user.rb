class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :items, dependent: :destroy
  has_many :manages, dependent: :destroy
  has_many :plans, through: :items, dependent: :destroy
end
