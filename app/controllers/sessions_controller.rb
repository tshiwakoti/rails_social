class SessionsController < ApplicationController

  before_action :require_login, only: [:index, :create, :destroy]

  def new
  end

  def destroy
    session.destroy
    redirect_to '/sessions/new'
  end

  def create
    user = User.find_by(email: params[:Email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      @user = User.find_by(email: params[:Email])
      redirect_to "/users/#{user.id}"
    else
      # fail
      #show flash error messages
      flash[:errors] = "Invalid Email/Password. Please Try Again"
      redirect_to "/sessions/new"
    end
  end
end
