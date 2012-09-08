require 'test_helper'

class ChannelTest < ActiveSupport::TestCase
  # attributes

  test 'present attributes' do
    channel = Channel.new

    assert channel.invalid?

    assert_present channel.errors[:name]
    assert_equal I18n.t('activerecord.errors.messages.blank'), channel.errors[:name].join(';')
    assert_present channel.errors[:slug]
    assert_equal I18n.t('activerecord.errors.messages.blank'), channel.errors[:slug].join(';')
    assert_present channel.errors[:user_id]
    assert_equal I18n.t('activerecord.errors.messages.blank'), channel.errors[:user_id].join(';')
  end

  test 'unique attributes' do
    channel = create(:channel)
    new_channel = build(:channel, { name: channel.name, slug: channel.slug })

    assert new_channel.invalid?

    assert_present new_channel.errors[:name]
    assert_equal I18n.t('activerecord.errors.messages.taken'), new_channel.errors[:name].join(';')
  end
end
