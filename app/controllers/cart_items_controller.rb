class CartItemsController < ApplicationController
#before_action :setup_cart_item!, only: [:create, :index, :destroy, :destroy_all]
  def index
   @cart_items = current_customer.cart_items.all
   #@items = current_customer.cart_items.all

  end

  def create
    @cart_item = current_customer.cart_items.build(cart_item_params)
    @cart_items = current_customer.cart_items.all

    @cart_items.each do |cart_item|
      if cart_item.item_id == @cart_item.item_id
        new_amount = cart_item.amount + @cart_item.amount
        cart_item.update_attribute(:amount, new_amount)
        @cart_item.delete
      end
    end
    @cart_item.save
    redirect_to :cart_items

  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(amount: params[:cart_item][:amount])
    redirect_to cart_items_path
  end



  def destroy
    cart_item = CartItem.find(params[:id])
    CartItem.destroy(cart_item.id)
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end


private
  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end

  def setup_cart_item!
    @cart_item = current_customer.cart_items.find_by(item_id: params[:item_id])
  end
end