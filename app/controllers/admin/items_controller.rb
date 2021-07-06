class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.save!
    redirect_to admin_item_path(item.id)

  end

  def index
    @item = Item.new
    @items = Item.all.order(item_id: :asc).page(params[:page]).per(5)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(item.id)
  end

private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :genre_id,:image)
  end

end
