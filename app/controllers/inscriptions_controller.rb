class InscriptionsController < ApplicationController
  before_action :authenticate_user!
  def create
    @event = Event.find(params[:event_id])
    @inscription = @event.inscriptions.build(user: current_user)

    if @inscription.save
      redirect_to @event, notice: "Vous êtes inscrit à l'événement."
    else
      redirect_to @event, alert: "Une erreur est survenue lors de l'inscription."
    end
  end
end
