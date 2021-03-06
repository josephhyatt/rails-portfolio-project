class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  def index
    @events = Event.all
  end

  def show
  end

  def new 
    @event = Event.new
  end

  def create 
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Event successfully created!"
      redirect_to @event
    else
      flash.now[:alert] = "Event wasn't created"
      render "new"
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      flash[:notice] = "Event updated!"
      redirect_to @event
    else
      flash.now[:alert] = "Event did not update!"
      render "edit"
    end
  end

  def destroy
    @event.destroy
    flash[:alert] = "Event deleted successfully"
    redirect_to events_path
  end
  
  
  private 

  def set_event
    @event = Event.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The page you requested does not exist."
    redirect_to events_path
  end

  def event_params 
    params.require(:event).permit(:title, :description, :start_date, :end_date, :venue, :location)
  end

end
