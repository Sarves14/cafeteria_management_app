class CartsController < ApplicationController
  skip_before_action :ensure_clerk_signin
  skip_before_action :ensure_admin_signin

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
    cart_item.item_quantity += params[:item_quantity].to_i
    if (cart_item.item_quantity == 0)
      cart_item.destroy
    else
      cart_item.save
    end
    redirect_to items_path
  end
end
