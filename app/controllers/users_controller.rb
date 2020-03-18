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
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
   user = User.find params[:id]
   cloudinary = Cloudinary::Uploader.upload( params[ "user" ][ "image" ] )
   user.update user_params
   user.update :image => cloudinary["url"]
   redirect_to user_path
   end

  def show
    @user = User.find params[:id]
    @posts = Post.where("user_id = ?", @current_user.id)
  # raise "hell"
  end

  def following
  @title = "Following"
  @user  = User.find(params[:id])
  @users = @user.following.paginate(page: params[:page])
  render 'show_follow'
  end

  def followers
  @title = "Followers"
  @user  = User.find(params[:id])
  @users = @user.followers.paginate(page: params[:page])
  render 'show_follow'
  end



  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
