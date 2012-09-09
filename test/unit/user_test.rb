require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # attributes

  test 'present attributes' do
    user = User.new

    assert user.invalid?

    assert_present user.errors[:email]
    assert_equal I18n.t('activerecord.errors.messages.blank'), user.errors[:email].join(';')
    assert_present user.errors[:first_name]
    assert_equal I18n.t('activerecord.errors.messages.blank'), user.errors[:first_name].join(';')
    assert_present user.errors[:last_name]
    assert_equal I18n.t('activerecord.errors.messages.blank'), user.errors[:last_name].join(';')
    assert_present user.errors[:provider]
    assert_equal I18n.t('activerecord.errors.messages.blank'), user.errors[:provider].join(';')
    assert_present user.errors[:uid]
    assert_equal I18n.t('activerecord.errors.messages.blank'), user.errors[:uid].join(';')
  end

  test 'unique attributes' do
    user = create(:user)
    new_user = build(:user, { uid: user.uid })

    assert new_user.invalid?

    assert_present new_user.errors[:uid]
    assert_equal I18n.t('activerecord.errors.messages.taken'), new_user.errors[:uid].join(';')
  end
end
