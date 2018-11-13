class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    @user = @user.try(:authenticate, params[:user][:password])

    if @user
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      flash[:alert] = "Your username or password was incorrect!"
      redirect_to login_path
    end
  end

  def delete
    session.delete :user_id
    redirect_to login_path
  end
end
