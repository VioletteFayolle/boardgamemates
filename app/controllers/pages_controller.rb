class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home
    @event = Event.new
    @events = Event.includes(:boardgames).limit(3)
  end
end
