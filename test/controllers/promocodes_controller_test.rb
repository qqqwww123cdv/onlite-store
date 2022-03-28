require "test_helper"

class PromocodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @promocode = promocodes(:one)
  end

  test "should get index" do
    get promocodes_url
    assert_response :success
  end

  test "should get new" do
    get new_promocode_url
    assert_response :success
  end

  test "should create promocode" do
    assert_difference('Promocode.count') do
      post promocodes_url, params: { promocode: { code: @promocode.code, discount: @promocode.discount } }
    end

    assert_redirected_to promocode_url(Promocode.last)
  end

  test "should show promocode" do
    get promocode_url(@promocode)
    assert_response :success
  end

  test "should get edit" do
    get edit_promocode_url(@promocode)
    assert_response :success
  end

  test "should update promocode" do
    patch promocode_url(@promocode), params: { promocode: { code: @promocode.code, discount: @promocode.discount } }
    assert_redirected_to promocode_url(@promocode)
  end

  test "should destroy promocode" do
    assert_difference('Promocode.count', -1) do
      delete promocode_url(@promocode)
    end

    assert_redirected_to promocodes_url
  end
end
