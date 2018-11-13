class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def require_login
    redirect_to login_path, alert: "You must log in first." unless logged_in?
  end

  def current_user
    session[:user_id]
  end

  def logged_in?
    !!current_user
  end
end
