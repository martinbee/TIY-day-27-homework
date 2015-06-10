class SessionController < ApplicationController

  def new
  end

  def create
    username = params[:username]
    password = params[:password]

    #get the user
    user = User.find_by username: username
    if (user) && (user.authenticate password)
      session[:id] = user.id
      redirect_to root_path
    else
      flash.now[:alert] = "Try Again"
      render :new
    end
  end

  def delete
    session.delete :id
    redirect_to root_path, notice: "You are no longer logged in"
  end

end
