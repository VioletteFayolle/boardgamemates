class User < ApplicationRecord
  has_many :my_events, class_name: 'Event', foreign_key: 'user_id', dependent: :destroy

  has_many :inscriptions, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :events, through: :inscriptions, source: :event, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 25 }
  validates :first_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :birth_date, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
