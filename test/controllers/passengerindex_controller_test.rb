require 'test_helper'

class PassengerindexControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get passengerindex_new_url
    assert_response :success
  end

  test "should get create" do
    get passengerindex_create_url
    assert_response :success
  end

  test "should get edit" do
    get passengerindex_edit_url
    assert_response :success
  end

  test "should get update" do
    get passengerindex_update_url
    assert_response :success
  end

  test "should get show" do
    get passengerindex_show_url
    assert_response :success
  end

  test "should get delete" do
    get passengerindex_delete_url
    assert_response :success
  end

end
