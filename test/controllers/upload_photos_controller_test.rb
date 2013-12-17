require 'test_helper'

class UploadPhotosControllerTest < ActionController::TestCase
  setup do
    @upload_photo = upload_photos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:upload_photos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create upload_photo" do
    assert_difference('UploadPhoto.count') do
      post :create, upload_photo: { content_type: @upload_photo.content_type, file: @upload_photo.file, name: @upload_photo.name, size: @upload_photo.size }
    end

    assert_redirected_to upload_photo_path(assigns(:upload_photo))
  end

  test "should show upload_photo" do
    get :show, id: @upload_photo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @upload_photo
    assert_response :success
  end

  test "should update upload_photo" do
    patch :update, id: @upload_photo, upload_photo: { content_type: @upload_photo.content_type, file: @upload_photo.file, name: @upload_photo.name, size: @upload_photo.size }
    assert_redirected_to upload_photo_path(assigns(:upload_photo))
  end

  test "should destroy upload_photo" do
    assert_difference('UploadPhoto.count', -1) do
      delete :destroy, id: @upload_photo
    end

    assert_redirected_to upload_photos_path
  end
end
