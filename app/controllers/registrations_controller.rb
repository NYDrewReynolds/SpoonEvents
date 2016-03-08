class RegistrationsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @user = User.find(params[:user_id])
    registration = @event.registrations.create(user_id: @user.id)
    if @registration.save
      flash[:success] = "You're going to #{@event.name}!"
      redirect_to event_path(@event)
    else
      flash[:danger] = "There was an error creating your registration."
      render :new
    end
  end

end
