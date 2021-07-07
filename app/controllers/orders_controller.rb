class OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end

  def confirm
    @billing_amount = calculate(current_customer)
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    if params[:address_status] == "ご自身の住所"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    elsif params[:address_status] == "登録済住所から選択"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    else params[:address_status] == "新しいお届け先"
      params[:order][:postal_code] = @order.postal_code
      params[:order][:address] = @order.address
      params[:order][:name] = @order.name
    end
  end

    def thanks
    end

    def create
      order = Order.new(order_params)
      if order.save!
        current_customer.cart_items.each do |cart_item|
        @order_item = OrderItem.new(order_id: order.id, item_id: cart_item.item.id, amount: cart_item.amount, price: cart_item.item.price )
        @billing_amount = calculate(current_customer)
        @order_item.save
        end
        current_customer.cart_items.delete_all
        redirect_to orders_thanks_path
      else
        render :new
        end
    end

  def index
    @orders = current_customer.orders.all
    @order_items =  OrderItem.all
    end


  def show
    @order = Order.find(params[:id])
    @orders = Order.all
   end


  private
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :billing_amount, :payment_method)
  end

   def calculate(customer)
     billing_amount = 0
     customer.cart_items.each do |cart_item|
      billing_amount += cart_item.amount* cart_item.item.price
      end
    return billing_amount
   end
 end