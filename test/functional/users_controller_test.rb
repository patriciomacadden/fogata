require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:admin)
    
    @new_user = User.new first_name: 'New', last_name: 'User', username: 'newuser', email: 'newuser@smoke_signals.com', locale: 'es', timezone: 'Buenos Aires'
  end

  test "admin user should get index" do
    sign_in @user

    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end
  
  test "non admin user should not get index" do
    @user = users(:patricio)
    sign_in @user

    get :index
    assert_response :missing
  end

  test "admin user should get new" do
    sign_in @user

    get :new
    assert_response :success
  end
  
  test "non admin user should not get new" do
    @user = users(:patricio)
    sign_in @user

    get :new
    assert_response :missing
  end

  test "admin user should create user" do
    sign_in @user

    attributes = @new_user.attributes.reject { |key, value| ['id', 'password_digest', 'created_at', 'updated_at'].include? key }
    attributes['password'] = 'newuser1234'
    assert_difference('User.count') do
      post :create, user: attributes
    end

    assert_redirected_to users_path
  end
  
  test "non admin user should not create user" do
    @user = users(:patricio)
    sign_in @user

    attributes = @new_user.attributes.reject { |key, value| ['id', 'password_digest', 'created_at', 'updated_at'].include? key }
    attributes['password'] = 'newuser1234'
    assert_no_difference('User.count') do
      post :create, user: attributes
    end

    assert_response :missing
  end

  test "admin user should get edit (himself)" do
    sign_in @user

    get :edit, id: @user
    assert_response :success
  end
  
  test "admin user should get edit (other user)" do
    sign_in @user

    get :edit, id: users(:patricio)
    assert_response :success
  end
  
  test "non admin user should get edit (himself)" do
    sign_in users(:patricio)

    get :edit, id: users(:patricio)
    assert_response :success
  end
  
  test "non admin user should not get edit (other user)" do
    sign_in users(:patricio)

    get :edit, id: @user
    assert_response :missing
  end

  test "admin user should update user (himself)" do
    sign_in @user

    put :update, id: @user, user: @user.attributes.reject { |key, value| ['id', 'password_digest', 'created_at', 'updated_at'].include? key }
    assert_redirected_to users_path
  end
  
  test "admin user should update user (other user)" do
    sign_in @user

    put :update, id: users(:patricio), user: users(:patricio).attributes.reject { |key, value| ['id', 'password_digest', 'created_at', 'updated_at'].include? key }
    assert_redirected_to users_path
  end
  
  test "non admin user should update user (himself)" do
    sign_in users(:patricio)

    put :update, id: users(:patricio), user: users(:patricio).attributes.reject { |key, value| ['id', 'password_digest', 'created_at', 'updated_at'].include? key }
    assert_redirected_to edit_user_path(users(:patricio))
  end
  
  test "non admin user should not update user (other user)" do
    sign_in users(:patricio)

    put :update, id: @user, user: @user.attributes.reject { |key, value| ['id', 'password_digest', 'created_at', 'updated_at'].include? key }
    assert_response :missing
  end

  test "admin user should destroy user" do
    sign_in @user

    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
  
  test "non admin user should not destroy user" do
    sign_in users(:patricio)

    assert_no_difference('User.count') do
      delete :destroy, id: users(:patricio)
    end

    assert_response :missing
  end
end
