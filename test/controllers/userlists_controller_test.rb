require "test_helper"

class UserlistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @userlist = userlists(:one)
  end

  test "should get index" do
    get userlists_url
    assert_response :success
  end

  test "should get new" do
    get new_userlist_url
    assert_response :success
  end

  test "should create userlist" do
    assert_difference("Userlist.count") do
      post userlists_url, params: { userlist: { address: @userlist.address, email: @userlist.email, username: @userlist.username } }
    end

    assert_redirected_to userlist_url(Userlist.last)
  end

  test "should show userlist" do
    get userlist_url(@userlist)
    assert_response :success
  end

  test "should get edit" do
    get edit_userlist_url(@userlist)
    assert_response :success
  end

  test "should update userlist" do
    patch userlist_url(@userlist), params: { userlist: { address: @userlist.address, email: @userlist.email, username: @userlist.username } }
    assert_redirected_to userlist_url(@userlist)
  end

  test "should destroy userlist" do
    assert_difference("Userlist.count", -1) do
      delete userlist_url(@userlist)
    end

    assert_redirected_to userlists_url
  end
end
