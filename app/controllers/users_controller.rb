class UsersController < ApplicationController
  before_action :logged_in?, except: [:create, :new]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @up_events = @user.events.select{ |event| event if event.event_date > DateTime.now }
    @prev_events = @user.events.select{ |event| event if event.event_date < DateTime.now }
  end

  def create
    user_params = params.require(:user).permit(:username)
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "SignUp was successful!"
    else
      flash.now.alert = "Invalid User name, try again!"
      render 'new'
    end
  end
end
