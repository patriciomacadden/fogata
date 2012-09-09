require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  setup do
    @message = create(:message)
    sign_in create(:user)
  end

  test "should create message" do
    assert_difference('Message.count') do
      post :create, channel_id: @message.channel_id, message: { text: 'Some random text message' }
    end

    assert_redirected_to channel_path(assigns(:message).channel)
  end
end
