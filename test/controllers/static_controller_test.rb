require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get calculate" do
    get :calculate
    assert_response :success
  end

  test "should get call" do
    get :call
    assert_response :success
  end

end
