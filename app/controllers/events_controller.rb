class EventsController < ApplicationController
  include Gatekeeper

  before_action :restrict_to_admins

  def index
    @events = Event.order(:start_at, :end_at)
  end

  def new
    @event = Event.new
  end

  def create
    Event.create(event_params)
    redirect_to action: :new, notice: "Added <%= link_to(event, event.id) %>".html_safe
  end

  private

  def event_params
    params.require(:event).permit!
  end
end
