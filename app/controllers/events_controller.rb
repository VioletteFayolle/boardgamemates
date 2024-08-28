class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index

    @events = Event.all

    if params[:search].present?
      @events = @events.where("city ILIKE ?", "%#{params[:search][:city]}%") if params[:search][:city].present?
      @events = @events.where("date::text ILIKE ?", "%#{params[:search][:date]}%") if params[:search][:date].present?
      @events = @events.joins(:boardgames).where("boardgames.name ILIKE ?", "%#{params[:search][:boardgame]}%") if params[:search][:boardgame].present?
    end

    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
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
    @boardgames = Boardgame.all
  end

  def create
    @event = Event.new(event_params)
    @event.boardgames << Boardgame.where(id: params[:event][:boardgame_ids].split(","))
    @event.creator = current_user
    if @event.save
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity, locals: { event: @event }
    end

  end

  def chat
    @event = Event.find(params[:id])
    @message = Message.new
  end


  private

  def event_params
    params.require(:event).permit(:title, :description, :address, :date, :time, :capacity, :longitude, :latitude)
  end

end
