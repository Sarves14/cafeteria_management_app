class ClerksController < ApplicationController
  def index
    render "index"
  end

  def update
    order = Order.find(params[:id])
    order.delivered_time = Time.now
    order.save
    redirect_to "/"
  end
end
