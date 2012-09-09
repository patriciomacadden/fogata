require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # attributes

  test 'text message present attributes' do
    message = TextMessage.new

    assert message.invalid?

    assert_present message.errors[:channel_id]
    assert_equal I18n.t('activerecord.errors.messages.blank'), message.errors[:channel_id].join(';')
    assert_present message.errors[:text]
    assert_equal I18n.t('activerecord.errors.messages.blank'), message.errors[:text].join(';')
    assert_present message.errors[:user_id]
    assert_equal I18n.t('activerecord.errors.messages.blank'), message.errors[:user_id].join(';')
  end
  
  test 'current topic change message present attributes' do
    message = CurrentTopicChangeMessage.new

    assert message.invalid?

    assert_present message.errors[:channel_id]
    assert_equal I18n.t('activerecord.errors.messages.blank'), message.errors[:channel_id].join(';')
    assert_present message.errors[:user_id]
    assert_equal I18n.t('activerecord.errors.messages.blank'), message.errors[:user_id].join(';')
  end
end
