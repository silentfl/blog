class TagsController < ApplicationController
  respond_to :html

  def show
    @tag = params[:id]
    @posts = Post.tagged_with(params[:id])
    respond_with(@posts)
  end
end
