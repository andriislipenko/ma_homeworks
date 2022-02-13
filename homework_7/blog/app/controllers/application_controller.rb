class ApplicationController < ActionController::API
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate
    render plain: 'You must be logged in!', status: :forbidden unless current_user
  end
end
