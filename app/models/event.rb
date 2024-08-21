class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :location, presence: true
  validates :date, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
