class Admin::HomesController < ApplicationController

  def top
   @orders = Order.all.order(order_id: :asc).page(params[:page]).per(3)
   @order_items = OrderItem.all

  end

end
