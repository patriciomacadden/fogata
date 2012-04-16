require 'test_helper'

class UploadTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  # How to test carrierwave + test_unit?
  #test 'a new upload should have an upload, an user_id and a channel_id' do
  #  upload = Upload.new
  #  
  #  assert upload.invalid?
  #  assert_present upload.errors[:upload]
  #  assert_present upload.errors[:user_id]
  #  assert_present upload.errors[:channel_id]
  #end
  #
  #test 'an upload should have an unique upload' do
  #  upload = Upload.create upload: uploads(:one).upload, user_id: uploads(:one).user_id, channel_id: uploads(:one).channel_id
  #  
  #  assert upload.invalid?
  #  assert_equal 'has already been taken', upload.errors[:upload].join(';')
  #end
  #
  #test 'an upload message should be created after the upload is created' do
  #  assert_difference('Message.count') do
  #    Upload.create upload: 'a_test_image.png', user_id: uploads(:one).user_id, channel_id: uploads(:one).channel_id
  #  end
  #end
  #
  #test 'latest scope should find the latest 5 uploads' do
  #  assert Upload.latest.count <= 5
  #end
end
