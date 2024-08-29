require 'open-uri'

class User < ApplicationRecord
  has_one_attached :photo

  has_many :my_events, class_name: 'Event', foreign_key: 'user_id', dependent: :destroy

  has_many :inscriptions, dependent: :destroy
  has_many :requests, through: :my_events, source: :inscriptions, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :events, through: :inscriptions, source: :event, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 25 }
  validates :first_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :last_name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :age, presence: true
  validates :city, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :generate_initials_image

  def generate_initials_image
    image = Cloudinary::Uploader.upload("https://fakeimg.pl/150x150/cccccc/?text= ",
                                        public_id: "user_#{id}_initials",
                                        transformation: [
                                          { width: 150, height: 150, gravity: "center", crop: "fill" },
                                          { overlay: "text:Arial_60_bold:#{initials}", gravity: "center", color: "white" }
                                        ])

    self.photo.attach(io: URI.open(image["secure_url"]), filename: "user_#{id}_initials.png")
  end
  #  "https://via.placeholder.com/150x150.png?text=#{initials}"
  #  "https://placehold.co/150/png?text=#{initials}"
  private

  def initials
    "#{first_name[0].upcase}#{last_name[0].upcase}"
  end
end
