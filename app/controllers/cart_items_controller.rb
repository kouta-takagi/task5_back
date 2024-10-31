class CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.includes(:product)
    render json: @cart_items, include: :product
  end

  def create
    if @cart_item = CartItem.find_by(product_id: params[:product_id])
      @cart_item.quantity += params[:quantity].to_i
    else
      @cart_item = CartItem.new(cart_item_params)
    end
    if @cart_item.save
      render status: :created
    else
      render status: :unprocessable_entity
    end
  end

  def update
    @cart_item = CartItem.find(params[:product_id])
    if @cart_item.update(cart_item_params)
      @cart_items = CartItem.includes(:product)
      render json: @cart_items, include: :product
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity, :product_id)
  end
end
