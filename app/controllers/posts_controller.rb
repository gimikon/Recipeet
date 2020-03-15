class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
   @post = Post.find params[:id]
  end

  def new
  end

  def create
    @post = Post.new(content: params[:content])
    @post.save
    redirect_to("/posts")
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find_by(id:params[:id])
    @post.content = params[:content]
    @post.title = params[:title]
    @post.save
    redirect_to("/posts")
  end

  def destroy
    @post = Post.find_by(id:params[:id])
    @post.destroy
    redirect_to("/posts")
  end

end
