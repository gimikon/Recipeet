class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "New user has been successfully created"
      redirect_to("/posts")
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
  @user = User.find_by(id: params[:id])
   @user.username = params[:username]
   @user.email = params[:email]
   if @user.save
     flash[:notice] = "User editted"
     redirect_to("/users/#{@user.id}")
   else
     render("users/edit")
   end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
