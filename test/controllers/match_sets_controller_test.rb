require 'test_helper'

class MatchSetsControllerTest < ActionController::TestCase
  setup do
    @match_set = match_sets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:match_sets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create match_set" do
    assert_difference('MatchSet.count') do
      post :create, match_set: { away_user_score: @match_set.away_user_score, home_user_score: @match_set.home_user_score, user_match_id: @match_set.user_match_id }
    end

    assert_redirected_to match_set_path(assigns(:match_set))
  end

  test "should show match_set" do
    get :show, id: @match_set
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @match_set
    assert_response :success
  end

  test "should update match_set" do
    patch :update, id: @match_set, match_set: { away_user_score: @match_set.away_user_score, home_user_score: @match_set.home_user_score, user_match_id: @match_set.user_match_id }
    assert_redirected_to match_set_path(assigns(:match_set))
  end

  test "should destroy match_set" do
    assert_difference('MatchSet.count', -1) do
      delete :destroy, id: @match_set
    end

    assert_redirected_to match_sets_path
  end
end
