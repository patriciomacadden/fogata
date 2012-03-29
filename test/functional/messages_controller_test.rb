require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  setup do
    @message = messages(:hello)
  end

  test "should create message" do
    session[:user_id] = users(:admin).id
    
    assert_difference('Message.count') do
      xml_http_request :post, :create, channel_id: channels(:main).id, message: @message.attributes
    end
    
    assert_response :success
  end
end
