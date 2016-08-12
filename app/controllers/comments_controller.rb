class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    comment = @post.comments.create(comment_params)
    comment.user = current_user if current_user
    comment.post = @post
    if comment.save
      redirect_to post_path(@post)
    else
      flash[:error] = "Comment can't be save"
    end
  end

  def accept
    update_status(:accept)
  end

  def decline
    update_status(:decline)
  end

  def remove
    @post = Post.find(params[:post_id])
    comment = Comment.where(id: params[:comment_id]).first
    if comment.delete
      redirect_to post_path(@post)
    else
      flash[:error] = "Comment can't be removed"
    end
  end

  private

  def update_status(status)
    comment = Comment.where(id: params[:id]).first
    comment.update_attribute(:status, Comment.statuses[status])
    comment.save
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
