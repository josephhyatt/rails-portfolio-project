class EventsController < ApplicationController

  def new 
    @event = Event.new
  end

  def create 
    @event = Event.new(event_params)
    # if you save the event, send out flash message and send to events page
    if @event.save
      # flash creates notification request
      flash[:notice] = "Event successfully created!"
      redirect_to @event
    else
      # if event can't save, send out flash message and
      # flash.now doesn't need redirect
      flash.now[:alert] = "Event wasn't created"
      render "new"
    end
  end


  private 

  def event_params 
    params.require(:event).permit(:title, :description, :start_date, :end_date, :venue, :location)
  end

end
