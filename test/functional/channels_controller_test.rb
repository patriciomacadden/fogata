require 'test_helper'

class ChannelsControllerTest < ActionController::TestCase
  setup do
    @channel = channels(:main)
  end

  test "should get index" do
    sign_in users(:admin)
    
    get :index
    assert_response :success
    assert_not_nil assigns(:channels)
  end

  test "should get new" do
    sign_in users(:admin)
    
    get :new
    assert_response :success
  end

  test "should create channel" do
    sign_in users(:admin)
    
    new_channel = @channel
    new_channel.name = "#{@channel.name} - new"
    
    assert_difference('Channel.count') do
      post :create, channel: new_channel.attributes
    end

    assert_redirected_to channel_path(assigns(:channel))
  end

  test "should show channel" do
    sign_in users(:admin)
    
    get :show, id: @channel
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:admin)
    
    get :edit, id: @channel
    assert_response :success
  end

  test "should update channel" do
    sign_in users(:admin)
    
    put :update, id: @channel, channel: @channel.attributes
    assert_redirected_to channel_path(assigns(:channel))
  end

  test "should destroy channel" do
    sign_in users(:admin)
    
    assert_difference('Channel.count', -1) do
      delete :destroy, id: @channel
    end

    assert_redirected_to channels_path
  end
end
