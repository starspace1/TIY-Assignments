class PostsController < ApplicationController

  def index
   @posts = Post.paginate(:page => params[:page])
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    Post.create(params.require(:post).permit(:title, :author, :text))
    redirect_to '/posts'
  end

  def update
    Post.find(params[:id]).update(params.require(:post).permit(:title, :author, :text))
    redirect_to post_path
  end

  def delete
    Post.find(params[:id]).destroy
    redirect_to '/posts'
  end

end
