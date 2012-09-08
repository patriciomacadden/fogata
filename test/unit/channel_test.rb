require 'test_helper'

class ChannelTest < ActiveSupport::TestCase
  # attributes
  
  test 'present attributes' do
    channel = Channel.new
    
    assert channel.invalid?
    
    assert_present channel.errors[:name]
    assert_present channel.errors[:slug]
  end
  
  test 'unique attributes' do
    channel = create(:channel)
    new_channel = Channel.new do |c|
      c.name = channel.name
      c.slug = channel.slug
    end
    
    assert new_channel.invalid?
    
    assert_present new_channel.errors[:name]
    
    assert_equal I18n.t('activerecord.errors.messages.taken'), new_channel.errors[:name].join(';')
  end
end
