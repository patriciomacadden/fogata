require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test 'should get new/sign_in' do
    get :new
    assert_response :success
  end
  
  test 'should create a new user session with valid user credentials' do
    post :create, user: { username: users(:admin).username, password: 'admin' }
    assert_not_nil session[:user_id]
    assert_response :redirect
    assert_redirected_to root_url
  end
  
  test 'should destroy a user session' do
    session[:user_id] = users(:admin).id
    
    delete :destroy
    assert_nil session[:user_id]
    assert_response :redirect
    assert_redirected_to root_url
  end
end
