class MenuitemsController < ApplicationController
  skip_before_action :ensure_clerk_signin

  def create
    Item.create!(item_name: params[:item_name],
                 category_id: params[:category_id],
                 price: params[:price],
                 description: params[:description])
    redirect_to "/"
  end
end
