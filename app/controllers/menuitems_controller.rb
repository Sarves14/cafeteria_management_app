class MenuitemsController < ApplicationController
  skip_before_action :ensure_clerk_signin

  def create
    Item.create!(item_name: params[:item_name],
                 category_id: params[:category_id],
                 price: params[:price],
                 description: params[:description])
    redirect_to "/"
  end

  def change
    item = Item.find(params[:item_id])
    item.item_name = params[:item_name]
    item.price = params[:price]
    item.description = params[:description]
    item.save
    redirect_to "/"
  end

  def delete
    item = Item.find(params[:item_id])
    item.destroy
    redirect_to "/"
  end
end
