class ApplicationController < ActionController::Base
  def current_user
    User.where(id: session[:user_id]).first
  end

  def logged_in?
    render 'logins/new' unless current_user
  end
end
