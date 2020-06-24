require "application_system_test_case"

class RunningEntriesTest < ApplicationSystemTestCase
  setup do
    @running_entry = running_entries(:one)
  end

  test "visiting the index" do
    visit running_entries_url
    assert_selector "h1", text: "Running Entries"
  end

  test "creating a Running entry" do
    visit running_entries_url
    click_on "New Running Entry"

    fill_in "Strava activity", with: @running_entry.strava_activity
    click_on "Create Running entry"

    assert_text "Running entry was successfully created"
    click_on "Back"
  end

  test "updating a Running entry" do
    visit running_entries_url
    click_on "Edit", match: :first

    fill_in "Strava activity", with: @running_entry.strava_activity
    click_on "Update Running entry"

    assert_text "Running entry was successfully updated"
    click_on "Back"
  end

  test "destroying a Running entry" do
    visit running_entries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Running entry was successfully destroyed"
  end
end
