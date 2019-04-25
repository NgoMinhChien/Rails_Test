class CategoryController < ApplicationController

  def index
    @category = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products
  end
  
end
