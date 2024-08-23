class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

  has_many :boardgames_lists, dependent: :destroy
  has_many :inscriptions
  has_many :messages, dependent: :destroy
  has_many :users, through: :inscriptions

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :city, presence: true
  validates :address, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :date, presence: true

end
