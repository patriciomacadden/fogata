require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test 'a new text message should have a text, a channel_id and a user_id' do
    message = TextMessage.new
    
    assert message.invalid?
    assert_present message.errors[:text]
    assert_present message.errors[:channel_id]
    assert_present message.errors[:user_id]
  end
  
  test 'a new change topic message a channel_id and a user_id' do
    message = ChangeTopicMessage.new
    
    assert message.invalid?
    assert_blank message.errors[:text]
    assert_present message.errors[:channel_id]
    assert_present message.errors[:user_id]
  end
end
