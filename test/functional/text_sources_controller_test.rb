require 'test_helper'

class TextSourcesControllerTest < ActionController::TestCase
  setup do
    @text_source = text_sources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:text_sources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create text_source" do
    assert_difference('TextSource.count') do
      post :create, text_source: @text_source.attributes
    end

    assert_redirected_to text_source_path(assigns(:text_source))
  end

  test "should show text_source" do
    get :show, id: @text_source.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @text_source.to_param
    assert_response :success
  end

  test "should update text_source" do
    put :update, id: @text_source.to_param, text_source: @text_source.attributes
    assert_redirected_to text_source_path(assigns(:text_source))
  end

  test "should destroy text_source" do
    assert_difference('TextSource.count', -1) do
      delete :destroy, id: @text_source.to_param
    end

    assert_redirected_to text_sources_path
  end
end
