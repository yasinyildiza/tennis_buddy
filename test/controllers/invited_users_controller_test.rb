require 'test_helper'

class InvitedUsersControllerTest < ActionController::TestCase
  setup do
    @invited_user = invited_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invited_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invited_user" do
    assert_difference('InvitedUser.count') do
      post :create, invited_user: { email: @invited_user.email, inviter_id: @invited_user.inviter_id }
    end

    assert_redirected_to invited_user_path(assigns(:invited_user))
  end

  test "should show invited_user" do
    get :show, id: @invited_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invited_user
    assert_response :success
  end

  test "should update invited_user" do
    patch :update, id: @invited_user, invited_user: { email: @invited_user.email, inviter_id: @invited_user.inviter_id }
    assert_redirected_to invited_user_path(assigns(:invited_user))
  end

  test "should destroy invited_user" do
    assert_difference('InvitedUser.count', -1) do
      delete :destroy, id: @invited_user
    end

    assert_redirected_to invited_users_path
  end
end
