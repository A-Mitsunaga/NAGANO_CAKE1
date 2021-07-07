class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all.order(customer_id: :asc).page(params[:page]).per(3)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to admin_customer_path(customer.id)
  end

private
  def customer_params
    params.require(:customer).permit(:first_name, :first_name_kana, :last_name, :last_name_kana, :address, :postal_code, :telphone_number, :email, :customer_id)
  end

end
