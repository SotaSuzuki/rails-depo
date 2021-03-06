class AddProductPriceToLineItem < ActiveRecord::Migration[5.1]
  def up
    add_column :line_items, :price, :decimal
    LineItem.all.each do |item|
      item.update_attribute :price, item.product.price
    end
  end

  def down
    remove_column :line_items, :price
  end
end
