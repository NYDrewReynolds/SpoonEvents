class EventsController < ApplicationController
  # before_action :require_login

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      flash[:success] = "Your event was successfully created!"
      redirect_to @event
    else
      flash[:danger] = "There was an error creating your event."
      render :new
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:success] = "Your account was successfully updated!"
      redirect_to @event
    else
      flash[:danger] = "There was an error updating your account."
      render :edit
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def destroy
    @event.destroy
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :start_time)
  end
end
