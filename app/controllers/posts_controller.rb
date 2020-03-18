class PostsController < ApplicationController

  def index
    @posts = Post.all.order("created_at DESC")
    # @favorites_count = Favorite.where(post_id: @post.id).count
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create post_params
    if params[:file].present?
       req = Cloudinary::Uploader.upload(params[:file])
       post.image = req["public_id"]
       post.save
     end
    redirect_to posts_path
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    post = Post.find params[:id]
    post.update post_params
    redirect_to post
  end

  def show
    @post = Post.find params[:id]
  end

  def destroy
    post = Post.find params[:id]
    post.destroy
    redirect_to posts_path
  end

  private # The following methods aren't accessible outside of this class.
  def post_params
    # Strong params: white list of sanitised input -- stuff we are happy to let the user provide.
    params.require(:post).permit(:content,:image,:user_id)
  end
end
