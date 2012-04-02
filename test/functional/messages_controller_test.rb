require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  setup do
    @message = messages(:hello)
  end

  test "should create message" do
    sign_in users(:admin)
    
    assert_difference('Message.count') do
      xml_http_request :post, :create, channel_id: channels(:main).id, message: @message.attributes.reject { |k, v| ['id', 'type'].include? k }
    end
    
    assert_response :success
  end
end
