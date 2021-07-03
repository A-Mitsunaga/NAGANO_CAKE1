class Admin::OrdersController < ApplicationController

  def show
    @orders = Order.all
    #@cart_items = CartItem.all
    @order = Order.find(params[:id])
  end
end

#private
  #def customer_params
    #params.require(:order).permit(:amount)
  #end

