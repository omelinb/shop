require 'test_helper'

class Api::CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get api_carts_add_url
    assert_response :success
  end

  test "should get show" do
    get api_carts_show_url
    assert_response :success
  end

  test "should get remove" do
    get api_carts_remove_url
    assert_response :success
  end

end
