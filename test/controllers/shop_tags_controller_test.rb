require 'test_helper'

class ShopTagsControllerTest < ActionController::TestCase
  setup do
    @shop_tag = shop_tags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shop_tags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shop_tag" do
    assert_difference('ShopTag.count') do
      post :create, shop_tag: { shop_id: @shop_tag.shop_id, tag: @shop_tag.tag }
    end

    assert_redirected_to shop_tag_path(assigns(:shop_tag))
  end

  test "should show shop_tag" do
    get :show, id: @shop_tag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shop_tag
    assert_response :success
  end

  test "should update shop_tag" do
    patch :update, id: @shop_tag, shop_tag: { shop_id: @shop_tag.shop_id, tag: @shop_tag.tag }
    assert_redirected_to shop_tag_path(assigns(:shop_tag))
  end

  test "should destroy shop_tag" do
    assert_difference('ShopTag.count', -1) do
      delete :destroy, id: @shop_tag
    end

    assert_redirected_to shop_tags_path
  end
end
