require 'test_helper'

class UserMatchesControllerTest < ActionController::TestCase
  setup do
    @user_match = user_matches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_matches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_match" do
    assert_difference('UserMatch.count') do
      post :create, user_match: { away_user_id: @user_match.away_user_id, home_user_id: @user_match.home_user_id, tennis_court_id: @user_match.tennis_court_id }
    end

    assert_redirected_to user_match_path(assigns(:user_match))
  end

  test "should show user_match" do
    get :show, id: @user_match
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_match
    assert_response :success
  end

  test "should update user_match" do
    patch :update, id: @user_match, user_match: { away_user_id: @user_match.away_user_id, home_user_id: @user_match.home_user_id, tennis_court_id: @user_match.tennis_court_id }
    assert_redirected_to user_match_path(assigns(:user_match))
  end

  test "should destroy user_match" do
    assert_difference('UserMatch.count', -1) do
      delete :destroy, id: @user_match
    end

    assert_redirected_to user_matches_path
  end
end
