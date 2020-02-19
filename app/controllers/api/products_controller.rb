class Api::ProductsController < ApplicationController

  # GET /api/products
  def index
    @products = Product.all

    render json: { data: @products }
  end
end
