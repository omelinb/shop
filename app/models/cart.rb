class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  after_create :set_cleaner

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

    current_item.save
  end

  def remove_product(product)
    current_item = line_items.find_by(product_id: product.id)

    if current_item
      current_item.quantity -= 1
      current_item.save
    end

    current_item.destroy if current_item&.quantity == 0
  end

  def total_sum
    line_items.sum { |line_item| line_item.total_price }
  end

  def products_count
    line_items.sum { |line_item| line_item.quantity }
  end

  private

    def set_cleaner
      CleanerWorker.perform_in(5.minutes, id)
    end
end
