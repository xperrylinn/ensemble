require 'test_helper'

class RunningEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @running_entry = running_entries(:one)
  end

  test "should get index" do
    get running_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_running_entry_url
    assert_response :success
  end

  test "should create running_entry" do
    assert_difference('RunningEntry.count') do
      post running_entries_url, params: { running_entry: { strava_activity: @running_entry.strava_activity } }
    end

    assert_redirected_to running_entry_url(RunningEntry.last)
  end

  test "should show running_entry" do
    get running_entry_url(@running_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_running_entry_url(@running_entry)
    assert_response :success
  end

  test "should update running_entry" do
    patch running_entry_url(@running_entry), params: { running_entry: { strava_activity: @running_entry.strava_activity } }
    assert_redirected_to running_entry_url(@running_entry)
  end

  test "should destroy running_entry" do
    assert_difference('RunningEntry.count', -1) do
      delete running_entry_url(@running_entry)
    end

    assert_redirected_to running_entries_url
  end
end
