require 'test_helper'

class ChannelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test 'a new channel should have a name' do
    channel = Channel.new
    
    assert channel.invalid?
    assert_present channel.errors[:name]
  end
  
  test 'a new channel should have an unique name' do
    channel = Channel.create name: channels(:main).name
    
    assert channel.invalid?
    assert_equal 'has already been taken', channel.errors[:name].join
  end
  
  test 'Channel#pub_sub_name' do
    channel = channels(:main)
    
    assert_equal "/channels/#{channel.id}/messages/new", channel.pub_sub_name
  end
end
