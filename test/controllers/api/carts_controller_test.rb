require 'test_helper'

class Api::CartsControllerTest < ActionDispatch::IntegrationTest
  test "should not add because of quantity missing" do
    post api_cart_url, params: { product_id: 1 }
    assert_response :bad_request
  end

  test "should not add because of product_id missing" do
    post api_cart_url, params: { quantity: 1 }
    assert_response :bad_request
  end

  test "should not add because of bad param" do
    post api_cart_url, params: { product_id: 10, quantity: 10 }
    assert_response :bad_request
  end

  test "should add" do
    post api_cart_url, params: { product_id: 2, quantity: 5 }
    assert_response :success
  end

  test "should show" do
    get api_cart_url
    assert_response :success
  end
end
