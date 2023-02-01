require "test_helper"

class DisplayablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @displayable = displayables(:one)
  end

  test "should get index" do
    get displayables_url
    assert_response :success
  end

  test "should get new" do
    get new_displayable_url
    assert_response :success
  end

  test "should create displayable" do
    assert_difference("Displayable.count") do
      post displayables_url, params: { displayable: { color: @displayable.color, flatshading: @displayable.flatshading, name: @displayable.name } }
    end

    assert_redirected_to displayable_url(Displayable.last)
  end

  test "should show displayable" do
    get displayable_url(@displayable)
    assert_response :success
  end

  test "should get edit" do
    get edit_displayable_url(@displayable)
    assert_response :success
  end

  test "should update displayable" do
    patch displayable_url(@displayable), params: { displayable: { color: @displayable.color, flatshading: @displayable.flatshading, name: @displayable.name } }
    assert_redirected_to displayable_url(@displayable)
  end

  test "should destroy displayable" do
    assert_difference("Displayable.count", -1) do
      delete displayable_url(@displayable)
    end

    assert_redirected_to displayables_url
  end
end
