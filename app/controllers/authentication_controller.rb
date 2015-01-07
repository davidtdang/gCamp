class AuthenticationController < ApplicationController

  def create
    p params[:email]
    p params[:password]
    user = User.find_by_email(params["/sign-in"]["email"])
    if user && user.authenticate(params["/sign-in"]["password"])
      session[:user_id] = user.id
      redirect_to root_path
    else
      @sign_in_error = "Username / password combination is invalid"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
