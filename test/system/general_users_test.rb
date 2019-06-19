require "application_system_test_case"

class GeneralUsersTest < ApplicationSystemTestCase
  setup do
    @general_user = general_users(:one)
  end

  test "visiting the index" do
    visit general_users_url
    assert_selector "h1", text: "General Users"
  end

  test "creating a General user" do
    visit general_users_url
    click_on "New General User"

    fill_in "Email", with: @general_user.email
    fill_in "Provider", with: @general_user.provider_id
    click_on "Create General user"

    assert_text "General user was successfully created"
    click_on "Back"
  end

  test "updating a General user" do
    visit general_users_url
    click_on "Edit", match: :first

    fill_in "Email", with: @general_user.email
    fill_in "Provider", with: @general_user.provider_id
    click_on "Update General user"

    assert_text "General user was successfully updated"
    click_on "Back"
  end

  test "destroying a General user" do
    visit general_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "General user was successfully destroyed"
  end
end
