class CartSerializer
  def initialize(cart)
    @cart = cart
  end

  def serializible_hash
    { 
      data: {
        total_sum: @cart.total_sum,
        products_count: @cart.products_count,
        products: @cart.line_items.map do |line_item| 
          { 
            id: line_item.product_id,
            quantity: line_item.quantity,
            sum: line_item.total_price
          } 
        end
      }
    }
  end
end
