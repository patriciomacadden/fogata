require 'test_helper'

class OnlineTest < ActiveSupport::TestCase
  # attributes

  test 'present attributes' do
    online = Online.new

    assert online.invalid?

    assert_present online.errors[:channel_id]
    assert_equal I18n.t('activerecord.errors.messages.blank'), online.errors[:channel_id].join(';')
    assert_present online.errors[:user_id]
    assert_equal I18n.t('activerecord.errors.messages.blank'), online.errors[:user_id].join(';')
  end

  test 'unique attributes' do
    online = create(:online)
    new_online = build(:online, { channel_id: online.channel_id, user_id: online.user_id })

    assert new_online.invalid?

    assert_present new_online.errors[:user_id]
    assert_equal I18n.t('activerecord.errors.messages.taken'), new_online.errors[:user_id].join(';')
  end
end
