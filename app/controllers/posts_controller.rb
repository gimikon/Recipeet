class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)

  end

  def new
  end

  def create
    @post = Post.new(content: params[:content], image: params[:image], user_id: @current_user.id)
    @post.save
    redirect_to("/posts")
  end

  def show
   @post = Post.find params[:id]
   @post = Post.find_by(id: params[:id])
   @user = Post.find_by(id: @post.user_id)
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find_by(id:params[:id])
    @post.content = params[:content]
    @post.title = params[:title]
    if @post.save
    redirect_to("/posts")
    else
    render("/posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id:params[:id])
    @post.destroy
    redirect_to("/posts")
  end

end
