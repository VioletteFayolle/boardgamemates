class BoardgamesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]

  def show
    @boardgame = Boardgame.find_by(name: params[:name])
  end
end
