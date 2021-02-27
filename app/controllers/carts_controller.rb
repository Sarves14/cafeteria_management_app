class CartsController < ApplicationController
  def create
    print params[:id]
    Cart.create!(user_id: current_user.id,
                 item_id: params[:item_id],
                 item_quantity: 1)
    redirect_to items_path
  end

  def update
    id = params[:id]
    print id
    cart_item = Cart.where("user_id = ? and item_id = ?", @current_user.id, id).first
    if (params[:item_quantity] == "0")
      cart_item.destroy
    else
      cart_item.item_quantity = params[:item_quantity]
      cart_item.save
    end
    redirect_to items_path
  end
end
