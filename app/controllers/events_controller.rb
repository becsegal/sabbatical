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
    redirect_to action: :index, notice: "Added <%= link_to(event, event.id) %>".html_safe
  end

  def edit
    @event = event
  end

  def update
    event.update_attributes(event_params)
    redirect_to action: :new, notice: "Added <%= link_to(event, event.id) %>".html_safe
  end

  def destroy
    event.destroy
    redirect_to action: :index
  end

  private

  def event_params
    params.require(:event).permit!
  end

  def event
    Event.find(params[:id])
  end
end
