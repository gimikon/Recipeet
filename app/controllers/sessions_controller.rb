class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by :nick_name =>[:nick_name]
    if user.present? && user.authenticate(params[:password]) session[:user_id] = user.id
      redirect_to login_path
    end 

end
