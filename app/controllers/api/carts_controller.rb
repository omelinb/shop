class Api::CartsController < ApplicationController
  # include CurrentCart
  before_action :set_cart, only: %i[add_product show remove_product]

  # POST /api/cart
  def add_product
  end

  # GET /api/cart
  def show
    render json: @cart
  end

  # DELETE /api/cart/{product_id}
  def remove_product
  end

  private

    def set_cart
      @cart = Cart.all.last
    end
end
