require "application_system_test_case"

class UserlistsTest < ApplicationSystemTestCase
  setup do
    @userlist = userlists(:one)
  end

  test "visiting the index" do
    visit userlists_url
    assert_selector "h1", text: "Userlists"
  end

  test "should create userlist" do
    visit userlists_url
    click_on "New userlist"

    fill_in "Address", with: @userlist.address
    fill_in "Email", with: @userlist.email
    fill_in "Username", with: @userlist.username
    click_on "Create Userlist"

    assert_text "Userlist was successfully created"
    click_on "Back"
  end

  test "should update Userlist" do
    visit userlist_url(@userlist)
    click_on "Edit this userlist", match: :first

    fill_in "Address", with: @userlist.address
    fill_in "Email", with: @userlist.email
    fill_in "Username", with: @userlist.username
    click_on "Update Userlist"

    assert_text "Userlist was successfully updated"
    click_on "Back"
  end

  test "should destroy Userlist" do
    visit userlist_url(@userlist)
    accept_confirm { click_on "Destroy this userlist", match: :first }

    assert_text "Userlist was successfully destroyed"
  end
end
