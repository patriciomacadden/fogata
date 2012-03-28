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
end
