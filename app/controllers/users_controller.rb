class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user_params = params.require(:user).permit(:username)
    @user = User.new(user_params)

    # return render 'new' unless @user

    # session[:user_id] = @user.id
    # redirect_to root_path, notice: "SignUp was successful!"

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "SignUp was successful!"
    else
      flash.now.alert = "Invalid User name, try again!"
      render 'new'
    end
  end

end
