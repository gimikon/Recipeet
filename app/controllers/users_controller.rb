class UsersController < ApplicationController
  # before_action :check_for_admin, :only => [:index]

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
      redirect_to edit_user_path(@user.id)
    else
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
   user = User.find params[:id]
   cloudinary = Cloudinary::Uploader.upload( params[ "user" ][ "image" ] ) if ( params[ "user" ] ).present?
   user.update user_params
   user.update :image => cloudinary["url"]
   redirect_to user_path
   end

  def show
    @user = User.find params[:id]
    @following = following?(@user.id)
    # raise "hell"
    @posts = Post.where("user_id = ?", params[:id]).order("created_at DESC")

  end

  def following
  @title = "Following"
  @user  = User.find(params[:id])
  @users = User.find(params[:id]).following
  render 'show_follow'
  end

  def followers
  @title = "Followers"
  @user  = User.find(params[:id])
  @users = User.find(params[:id]).followers
  render 'show_follower'
  end



  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
