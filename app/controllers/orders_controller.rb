class OrdersController < ApplicationController
  skip_before_action :ensure_clerk_signin

  def show
    render "show", locals: { order_item: Order.find(params[:id]) }
  end

  def index
    render "index"
  end

  def create
    user_id = current_user.id
    cart_items = Cart.find_items(user_id)
    total_cost = Cart.total_cost(cart_items)
    order = Order.create!(user_id: current_user.id, price: total_cost, ordered_time: Time.now)
    Orderitem.insert_order(order.id, cart_items)
    Cart.where(user_id: @current_user.id).destroy_all
    redirect_to "/"
  end
end
