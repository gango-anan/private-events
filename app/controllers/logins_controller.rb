class LoginsController < ApplicationController
  def new; end

  def create
    @user = User.find_by_username(params[:username])
    if @user
      session[:user_id] = @user.id
      redirect_to @user, notice: "Welcome #{@user.username}!"
    else
      flash.now.alert = 'Username is invalid!'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    session[:event_id] = nil
    redirect_to root_path, notice: 'Signed Out!'
  end
end
