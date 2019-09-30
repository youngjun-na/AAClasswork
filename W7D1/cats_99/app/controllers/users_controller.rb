class UsersController < ApplicationController
  before_action :already_logged_in
  def new
    render :new
  end

  # def create
  #   if params[:user][:user_name] == nil || params[:user][:password] == nil || params[:user][:password].length < 6
  #     redirect_to new_user_url 
  #   else 
  #     @user = User.new(user_params)
  #     session[:session_token] = @user.session_token
  #     redirect_to cats_url
  #   end
  # end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:session_token] = @user.session_token
      redirect_to cats_url
    else         
      render :new
    end
  end
  private 

  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
