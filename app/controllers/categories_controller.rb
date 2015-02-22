class CategoriesController < ApplicationController
  before_action :require_user, only: [:new, :create]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    binding.pry
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "Your category has been created."
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end

