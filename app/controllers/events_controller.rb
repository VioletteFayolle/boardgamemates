class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path
    else
      render :event
    end

  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :date)
  end

end
