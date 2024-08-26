class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'

  has_many :boardgames_lists, dependent: :destroy
  has_many :boardgames, through: :boardgames_lists, dependent: :destroy
  has_many :inscriptions, dependent: :destroy
  has_many :participants, through: :inscriptions, source: :user
  has_many :messages, dependent: :destroy
  has_many :users, through: :inscriptions

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :address, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :date, presence: true

  after_validation :set_city

  geocoded_by :address

  after_validation :geocode, if: :will_save_change_to_address?

  private

  def set_city
    self.city = address.split(',')[-2].split(' ', 2)[1].strip
  end
end
