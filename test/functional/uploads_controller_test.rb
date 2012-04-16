require 'test_helper'

class UploadsControllerTest < ActionController::TestCase
  setup do
    @upload = uploads(:one)
  end

  # How to test carrierwave + test_unit?
  #test "should create upload" do
  #  assert_difference('Upload.count') do
  #    post :create, upload: @upload.attributes
  #  end
  #
  #  assert_redirected_to upload_path(assigns(:upload))
  #end
  #
  #test "should destroy upload" do
  #  assert_difference('Upload.count', -1) do
  #    delete :destroy, id: @upload
  #  end
  #
  #  assert_redirected_to uploads_path
  #end
end
