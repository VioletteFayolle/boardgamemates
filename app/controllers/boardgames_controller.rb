class BoardgamesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]

  def show
    @boardgame = Boardgame.find_by(name: params[:name])
  end

  def search
    @boardgames = Boardgame.where("name ILIKE ?", "%#{params[:query]}%")
    render json: @boardgames.pluck(:name)
  end

  def select
    @boardgame = Boardgame.find_by(name: params[:query])
    render json: {
      render: render_to_string(partial: "boardgames/card", locals: { boardgame: @boardgame, close: true }), id: @boardgame.id
    }
  end


end
