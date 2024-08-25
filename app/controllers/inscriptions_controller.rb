class InscriptionsController < ApplicationController
  before_action :authenticate_user!
  def create
    @event = Event.find(params[:event_id])
    @inscription = Inscription.create!(event: @event, user: current_user, status: "En attente", comment: params[:inscription][:comment])

    if @inscription.save
      redirect_to @event, notice: "Demande d'inscription envoyée"
    else
      redirect_to @event, alert: "Une erreur est survenue lors de l'envoie"
    end
  end

  def update
    @inscription = Inscription.find(params[:id])
    @inscription.update(status: params[:status])
    redirect_to mes_demandes_path
  end

  private

  def inscription_params
    params.require(:inscription).permit(:comment)
  end
end
