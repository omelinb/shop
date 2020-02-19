class Api::CartsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: %i[add_product show remove_product]
  rescue_from ActiveRecord::RecordNotFound, with: :record_error
  rescue_from ActionController::ParameterMissing, with: :params_error

  # POST /api/cart
  def add_product
    @product = Product.find(product_params[:product_id])
    @cart.add_product(product_params)

    head 200
  end

  # GET /api/cart
  def show
    render json: CartSerializer.new(@cart).serializible_hash, status: 200
  end

  # DELETE /api/cart/{product_id}
  def remove_product
    @product = Product.find(params[:product_id])
    @cart.remove_product(@product)

    head 200
  end

  private

    def product_params
      params.require(:product_id)
      params.require(:quantity)
      params.permit(:product_id, :quantity)
    end
end
