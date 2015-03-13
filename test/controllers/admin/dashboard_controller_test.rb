require 'test_helper'

class Admin::DashboardControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get declined" do
    get :declined
    assert_response :success
  end

  test "should get destroy_order" do
    get :destroy_order
    assert_response :success
  end

end
