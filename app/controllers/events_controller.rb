class EventsController < ApplicationController
  #before_action :set_event, only: [:update, :destroy, :show]
  before_action :logged_in?, except: :index

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    #@events = Event.where(creator_id: current_user.id)
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      redirect_to @event, notice: "Event Successfully Created!"
    else
      flash.now.alert = "Invalid Details, try again!"
      render 'new'
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:description, :event_date, :event_name, :event_venue, :creator_id)
  end
end
