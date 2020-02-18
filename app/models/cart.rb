class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_product(product_params)
    current_item = line_items.find_by(product_id: product_params[:product_id])

    if current_item
      current_item.quantity += product_params[:quantity]
    else
      current_item = line_items.build(
          product_id: product_params[:product_id],
          quantity: product_params[:quantity]
        )
    end

    current_item
  end

  def remove_product(product_id)
    current_item = line_items.find_by(product_id: product_id)

    if current_item
      current_item.quantity -= 1
      current_item.save
    end

    current_item.destroy if current_item&.quantity == 0
  end
end
