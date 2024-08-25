class MessagesController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @message = Message.new(message_params)
    @message.user = current_user
    @message.event = @event
    if @message.save
      redirect_to chat_path(@event)
    else
      render "events/chat", status: :unprocessable_entity, locals: { message: @message }, alert: "Une erreur est survenue lors de l'envoie"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
#
