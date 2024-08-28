class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index


    # if params[:search].present?
    #   if params[:search][:city].present?
    #     @events + Event.where("city ILIKE ?", "%#{params[:search][:city]}%")
    #     # @events.flatten!
    #   end

    # else
    #   @events = Event.all
    # end
    #
    @events = Event.all

    if params[:search].present?
      sqlquery = <<~SQL
      city ILIKE :query
      OR date::text ILIKE :query
      OR boardgame ILIKE :query
      SQL
      @events = @events.where(sqlquery, query: "%#{params[:search]}%")
    end

    puts @events

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
