class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @events = Event.all
    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: envent.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {event: event}),
        marker_html: render_to_string(partial: "marker", locals: {event: event})
      }
    end
  end

  def show
    @event = Event.find(params[:id])
    @inscription = Inscription.new
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
    params.require(:event).permit(:title, :description, :city, :address, :date, :capacity)
  end

end
