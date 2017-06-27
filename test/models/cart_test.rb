require 'test_helper'

class CartTest < ActiveSupport::TestCase
  fixtures :products

  def create_cart
    Cart.create
  end

  test "should create a new line item when adding a new product" do
    cart = create_cart
    cart.add_product(products(:ruby)).save!
    assert_equal cart.line_items.size, 1
    assert_equal cart.total_price, products(:ruby).price
  end

  test "should create two line items when adding two different products" do
    cart = create_cart
    cart.add_product(products(:ruby)).save!
    cart.add_product(products(:one)).save!
    assert_equal cart.line_items.size, 2
    assert_equal cart.total_price, products(:ruby).price + products(:one).price
  end

end
