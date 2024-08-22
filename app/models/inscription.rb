class Inscription < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :status, presence: true, inclusion: { in: ["En attente", "Validée", "Rejetée"] }
  validates :comment, length: { maximum: 255 }
end
