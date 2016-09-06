require 'test_helper'

class AdvertControllerTest < ActionController::TestCase
  test "should get title:string" do
    get :title:string
    assert_response :success
  end

  test "should get link:string" do
    get :link:string
    assert_response :success
  end

  test "should get active:integer" do
    get :active:integer
    assert_response :success
  end

  test "should get advert:attachment" do
    get :advert:attachment
    assert_response :success
  end

end
