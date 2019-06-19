require 'test_helper'

class GeneralUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @general_user = general_users(:one)
  end

  test "should get index" do
    get general_users_url
    assert_response :success
  end

  test "should get new" do
    get new_general_user_url
    assert_response :success
  end

  test "should create general_user" do
    assert_difference('GeneralUser.count') do
      post general_users_url, params: { general_user: { email: @general_user.email, provider_id: @general_user.provider_id } }
    end

    assert_redirected_to general_user_url(GeneralUser.last)
  end

  test "should show general_user" do
    get general_user_url(@general_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_general_user_url(@general_user)
    assert_response :success
  end

  test "should update general_user" do
    patch general_user_url(@general_user), params: { general_user: { email: @general_user.email, provider_id: @general_user.provider_id } }
    assert_redirected_to general_user_url(@general_user)
  end

  test "should destroy general_user" do
    assert_difference('GeneralUser.count', -1) do
      delete general_user_url(@general_user)
    end

    assert_redirected_to general_users_url
  end
end
