class Boardgame < ApplicationRecord
  has_many :boardgames_lists
  has_many :events, through: :boardgames_lists
end
