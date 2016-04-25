require 'test_helper'

class BasicPagesControllerTest < ActionController::TestCase

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home|HouseBuddy"
  end

  test "should get services" do
    get :services
    assert_response :success
    assert_select "title", "Services|HouseBuddy"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact|HouseBuddy"
  end

  test "should get signin" do
    get :signin
    assert_response :success
  end

end
