class CategoriesController < ApplicationController
  skip_before_action :ensure_clerk_signin

  def show
    @category = Category.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def create
    Category.create!(category_name: params[:category_name], status: "active")
    redirect_to "/"
  end

  def update
    category = Category.find(params[:category_id])
    category.category_name = params[:category_name]
    category.save
    redirect_to "/"
  end

  def destroy
    category = Category.find(params[:category_id])
    Item.find_by(category_id: params[:category_id]).destroy_all
    category.destroy
    redirect_to "/"
  end
end
