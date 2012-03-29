require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test 'a new message should have a text, a channel_id and a user_id' do
    message = Message.new
    
    assert message.invalid?
    assert_present message.errors[:text]
    assert_present message.errors[:channel_id]
    assert_present message.errors[:user_id]
  end
end
