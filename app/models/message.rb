class Message < ApplicationRecord
  belongs_to :event
  belongs_to :user

  before_commit :set_date


  validates :content, presence: true, length: { maximum: 300 }

  private

  def set_date
    #  self.date = DateTime.now
  end

end
