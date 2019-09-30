class ApplicationController < ActionController::Base
  helper_method :current_user, :already_logged_in
  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token ])
  end
  
  def logged_in?
    !!current_user
  end

  def login(user)
    @current_user = user
    login_user!
  end

  def login_user!
    @current_user.reset_session_token!
    session[:session_token] = @current_user.session_token
  end

  def already_logged_in
    redirect_to cats_url if logged_in?
  end
end
