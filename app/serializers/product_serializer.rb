class ProductSerializer
  def initialize(products)
    @products = products
  end

  def serializible_hash
    {
      data: @products.select(:id, :name, :description, :price)
    }
  end
end
