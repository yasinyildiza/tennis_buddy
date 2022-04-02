require 'test_helper'

class TennisCourtsControllerTest < ActionController::TestCase
  setup do
    @tennis_court = tennis_courts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tennis_courts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tennis_court" do
    assert_difference('TennisCourt.count') do
      post :create, tennis_court: { address: @tennis_court.address, city_id: @tennis_court.city_id, name: @tennis_court.name, phone_number: @tennis_court.phone_number }
    end

    assert_redirected_to tennis_court_path(assigns(:tennis_court))
  end

  test "should show tennis_court" do
    get :show, id: @tennis_court
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tennis_court
    assert_response :success
  end

  test "should update tennis_court" do
    patch :update, id: @tennis_court, tennis_court: { address: @tennis_court.address, city_id: @tennis_court.city_id, name: @tennis_court.name, phone_number: @tennis_court.phone_number }
    assert_redirected_to tennis_court_path(assigns(:tennis_court))
  end

  test "should destroy tennis_court" do
    assert_difference('TennisCourt.count', -1) do
      delete :destroy, id: @tennis_court
    end

    assert_redirected_to tennis_courts_path
  end
end
