require "application_system_test_case"

class DisplayablesTest < ApplicationSystemTestCase
  setup do
    @displayable = displayables(:one)
  end

  test "visiting the index" do
    visit displayables_url
    assert_selector "h1", text: "Displayables"
  end

  test "should create displayable" do
    visit displayables_url
    click_on "New displayable"

    fill_in "Color", with: @displayable.color
    check "Flatshading" if @displayable.flatshading
    fill_in "Name", with: @displayable.name
    click_on "Create Displayable"

    assert_text "Displayable was successfully created"
    click_on "Back"
  end

  test "should update Displayable" do
    visit displayable_url(@displayable)
    click_on "Edit this displayable", match: :first

    fill_in "Color", with: @displayable.color
    check "Flatshading" if @displayable.flatshading
    fill_in "Name", with: @displayable.name
    click_on "Update Displayable"

    assert_text "Displayable was successfully updated"
    click_on "Back"
  end

  test "should destroy Displayable" do
    visit displayable_url(@displayable)
    click_on "Destroy this displayable", match: :first

    assert_text "Displayable was successfully destroyed"
  end
end
