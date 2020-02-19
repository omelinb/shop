class Api::CartsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: %i[add_product show remove_product]

  # POST /api/cart
  def add_product
    @line_item = @cart.add_product(product_params)

    if @line_item.save
      head 200
    else
      head 400
    end
  end

  # GET /api/cart
  def show
    render json: CartSerializer.new(@cart).serializible_hash, status: 200
  end

  # DELETE /api/cart/{product_id}
  def remove_product
    @cart.remove_product(params[:product_id])

    head 200
  end

  private

    def product_params
      params.require(:product).permit(:product_id, :quantity)
    end
end
