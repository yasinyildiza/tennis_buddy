require 'test_helper'

class TennisClubsControllerTest < ActionController::TestCase
  setup do
    @tennis_club = tennis_clubs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tennis_clubs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tennis_club" do
    assert_difference('TennisClub.count') do
      post :create, tennis_club: { address: @tennis_club.address, city_id: @tennis_club.city_id, name: @tennis_club.name, phone_number: @tennis_club.phone_number }
    end

    assert_redirected_to tennis_club_path(assigns(:tennis_club))
  end

  test "should show tennis_club" do
    get :show, id: @tennis_club
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tennis_club
    assert_response :success
  end

  test "should update tennis_club" do
    patch :update, id: @tennis_club, tennis_club: { address: @tennis_club.address, city_id: @tennis_club.city_id, name: @tennis_club.name, phone_number: @tennis_club.phone_number }
    assert_redirected_to tennis_club_path(assigns(:tennis_club))
  end

  test "should destroy tennis_club" do
    assert_difference('TennisClub.count', -1) do
      delete :destroy, id: @tennis_club
    end

    assert_redirected_to tennis_clubs_path
  end
end
