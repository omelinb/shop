class Api::ProductsController < ApplicationController

  # GET /api/products
  def index
    @products = Product.all

    render json: ProductSerializer.new(@products).serializible_hash, status: 200
  end
end
