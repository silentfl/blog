class CommentsController < ApplicationController
  def accept
    update_status(:accept)
  end

  def decline
    update_status(:decline)
  end

  def remove
    comment = Comment.where(id: params[:id]).first
    comment.delete
  end

  private

  def update_status(status)
    comment = Comment.where(id: params[:id]).first
    comment.update_attribute(:status, Comment.statuses[status])
    comment.save
  end
end
