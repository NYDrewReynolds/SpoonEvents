class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # def event_owner
  #   @current_user.id = Event.find(params[:id]).owner_id
  # end

  def require_login
    unless current_user
      redirect_to root_path
    end
  end

  helper_method :current_user
  helper_method :require_login
  # helper_method :event_owner
end
