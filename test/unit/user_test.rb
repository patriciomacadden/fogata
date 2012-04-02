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
  
  test 'User#to_s should return user first name and user last name' do
    user = users(:admin)
    
    assert_equal "#{user.first_name} #{user.last_name}", user.to_s
  end
  
  test 'an user should be able to create a new channel' do
    user = users(:admin)
    ability = Ability.new(user)
    
    assert ability.can? :create, Channel.new
  end
  
  test 'an user should not be able to update a channel if he(she) is not allowed to' do
    user = users(:admin)
    ability = Ability.new(user)
    
    channel = Channel.create name: 'new channel', user: users(:patricio)
    
    assert ability.cannot? :update, channel
  end
  
  test 'an user should be able to update a channel if he(she) is allowed to' do
    user = users(:admin)
    ability = Ability.new(user)
    
    channel = Channel.create name: 'new channel', user: user
    
    assert ability.can? :update, channel
  end
  
  test 'an user should not be able to read a channel if he(she) is not allowed to' do
    user = users(:admin)
    ability = Ability.new(user)
    
    channel = Channel.create name: 'new channel', user: users(:patricio)
    
    assert ability.cannot? :read, channel
  end
  
  test 'an user should be able to read a channel if he(she) is allowed to' do
    user = users(:admin)
    ability = Ability.new(user)
    
    channel = Channel.create name: 'new channel', user: user
    
    assert ability.can? :read, channel
  end
  
  test 'an user should not be able to destroy a channel if he(she) is not allowed to' do
    user = users(:admin)
    ability = Ability.new(user)
    
    channel = Channel.create name: 'new channel', user: users(:patricio)
    
    assert ability.cannot? :destroy, channel
  end
  
  test 'an user should be able to destroy a channel if he(she) is allowed to' do
    user = users(:admin)
    ability = Ability.new(user)
    
    channel = Channel.create name: 'new channel', user: user
    
    assert ability.can? :destroy, channel
  end
end
