require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test 'a new user should have first name, last name, username, email and password' do
    user = User.new
    
    assert user.invalid?
    assert_present user.errors[:first_name]
    assert_present user.errors[:last_name]
    assert_present user.errors[:username]
    assert_present user.errors[:email]
    assert_present user.errors[:password]
  end
  
  test 'an user should have an unique username' do
    user = User.create first_name: users(:admin).first_name, last_name: users(:admin).last_name, username: users(:admin).username, email: users(:admin).email, password: users(:admin).password
    
    assert user.invalid?
    assert_equal 'has already been taken', user.errors[:username].join(';')
  end
  
  test 'saved password should be encrypted' do
    user = User.create! first_name: 'User', last_name: 'User', username: 'user', email: 'user@chatapp.com', password: 'user'
    
    assert_not_equal user.password, user.password_digest
  end
  
  test 'user password should not be required on update' do
    user = users(:admin)
    
    assert_blank user.errors[:password]
  end
end
