require 'test_helper'

class ChannelsControllerTest < ActionController::TestCase
  setup do
    @channel = create(:channel)
    
    sign_in create(:user)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:channels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should not create channel with blank fields" do
    assert_no_difference('Channel.count') do
      post :create, channel: { name: '' }
    end

    assert_response :success
    
    assert_present assigns(:channel).errors[:name]
    assert_equal I18n.t('activerecord.errors.messages.blank'), assigns(:channel).errors[:name].join(';')
  end
  
  test "should not create channel with non-unique fields" do
    assert_no_difference('Channel.count') do
      post :create, channel: { name: @channel.name }
    end

    assert_response :success
    
    assert_present assigns(:channel).errors[:name]
    assert_equal I18n.t('activerecord.errors.messages.taken'), assigns(:channel).errors[:name].join(';')
  end
  
  test "should create channel" do
    assert_difference('Channel.count') do
      post :create, channel: { name: 'New channel' }
    end

    assert_redirected_to channel_path(assigns(:channel))
  end

  test "should show channel" do
    get :show, id: @channel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @channel
    assert_response :success
  end

  test "should not update channel with blank fields" do
    put :update, id: @channel, channel: { name: '' }
    assert_response :success
    assert_equal I18n.t('activerecord.errors.messages.blank'), assigns(:channel).errors[:name].join(';')
  end
  
  test "should not update channel with non-unique fields" do
    channel = create(:channel)
    put :update, id: @channel, channel: { name: channel.name }
    assert_response :success
    assert_equal I18n.t('activerecord.errors.messages.taken'), assigns(:channel).errors[:name].join(';')
  end
  
  test "should update channel" do
    put :update, id: @channel, channel: { name: @channel.name }
    assert_redirected_to channel_path(assigns(:channel))
  end

  test "should destroy channel" do
    assert_difference('Channel.count', -1) do
      delete :destroy, id: @channel
    end

    assert_redirected_to channels_path
  end
end
