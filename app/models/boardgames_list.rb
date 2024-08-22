class BoardgamesList < ApplicationRecord
  belongs_to :event
  belongs_to :boardgames
end
