class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:danger] = "Invalid Login"
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    flash[:info] = "Logout Successful"
    redirect_to root_path
  end
end
