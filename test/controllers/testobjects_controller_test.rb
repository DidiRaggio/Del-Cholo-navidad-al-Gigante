require 'test_helper'

class TestobjectsControllerTest < ActionController::TestCase
  setup do
    @testobject = testobjects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:testobjects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create testobject" do
    assert_difference('Testobject.count') do
      post :create, testobject: { ad_source_connection_id: @testobject.ad_source_connection_id, bid: @testobject.bid, bid_rate: @testobject.bid_rate, impressions: @testobject.impressions, revenue: @testobject.revenue, revenue_ecpm: @testobject.revenue_ecpm }
    end

    assert_redirected_to testobject_path(assigns(:testobject))
  end

  test "should show testobject" do
    get :show, id: @testobject
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @testobject
    assert_response :success
  end

  test "should update testobject" do
    patch :update, id: @testobject, testobject: { ad_source_connection_id: @testobject.ad_source_connection_id, bid: @testobject.bid, bid_rate: @testobject.bid_rate, impressions: @testobject.impressions, revenue: @testobject.revenue, revenue_ecpm: @testobject.revenue_ecpm }
    assert_redirected_to testobject_path(assigns(:testobject))
  end

  test "should destroy testobject" do
    assert_difference('Testobject.count', -1) do
      delete :destroy, id: @testobject
    end

    assert_redirected_to testobjects_path
  end
end
