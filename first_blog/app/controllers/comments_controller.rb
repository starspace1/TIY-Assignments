class CommentsController < ApplicationController

  def create

    @post = Post.find(params[:post_id])
    @post.comments.create(params.require(:comment).permit(:author, :text)) 
    redirect_to post_path(@post)

  end

  def delete

    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:comment_id])
    @comment.destroy
    redirect_to post_path(@post)

  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:comment_id])
  end

  def update

    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:comment_id])
    @comment.update(params.require(:comment).permit(:author, :text)) 
    redirect_to post_path(@post)

  end

end
