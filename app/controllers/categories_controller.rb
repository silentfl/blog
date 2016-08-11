class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    # TODO 404
    @category = Category.find_by_name(params[:name])
    @posts = @category.posts
  end
end
