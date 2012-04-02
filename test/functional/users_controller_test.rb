require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:admin)
  end

  test "should get edit" do
    sign_in @user
    
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    sign_in @user
    
    put :update, id: @user, user: { password: 'new_password', password_confirmation: 'new_password' }
    assert_redirected_to edit_user_path(assigns(:user))
  end
end
