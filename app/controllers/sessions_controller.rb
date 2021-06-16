class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      flash[:success] = "You have logged in successfully"
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:danger] = "Incorrect details"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Log out successfully"
    redirect_to root_path
  end

end