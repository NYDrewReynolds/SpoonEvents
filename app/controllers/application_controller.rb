class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless current_user
      flash[:info] = "You must be logged in to view this page."
      redirect_to login_path
    end
  end

  def require_owner
    @event = Event.find(params[:id])
    unless current_user = @event.owner
      redirect_to @event
    end
  end

  def past_events
    past_events ||= current_user.events.where('start_time <= ?', Date.today)
  end

  def future_events
    future_events ||= current_user.events.where('start_time >= ?', Date.today)
  end

  def all_future_events
    all_future_events ||= Event.where('start_time >= ?', Date.today)
  end

  def owned_events
    owner_events ||= current_user.events
  end

  helper_method :current_user
  helper_method :require_login
  helper_method :require_owner
  helper_method :past_events
  helper_method :future_events
  helper_method :owned_events
  helper_method :all_future_events
end
