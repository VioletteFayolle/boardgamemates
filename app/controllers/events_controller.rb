class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.creator = current_user
    if @event.save
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity, locals: { vehicule: @vehicule }
    end

  end

  def chat

  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :date, :capacity)
  end

end
