require "application_system_test_case"

class EmergencyContactsTest < ApplicationSystemTestCase
  setup do
    @emergency_contact = emergency_contacts(:one)
  end

  test "visiting the index" do
    visit emergency_contacts_url
    assert_selector "h1", text: "Emergency contacts"
  end

  test "should create emergency contact" do
    visit emergency_contacts_url
    click_on "New emergency contact"

    fill_in "Gardian name", with: @emergency_contact.gardian_name
    fill_in "Gardian phone", with: @emergency_contact.gardian_phone
    fill_in "Gardian relation", with: @emergency_contact.gardian_relation
    fill_in "Student", with: @emergency_contact.student_id
    fill_in "Token", with: @emergency_contact.token
    click_on "Create Emergency contact"

    assert_text "Emergency contact was successfully created"
    click_on "Back"
  end

  test "should update Emergency contact" do
    visit emergency_contact_url(@emergency_contact)
    click_on "Edit this emergency contact", match: :first

    fill_in "Gardian name", with: @emergency_contact.gardian_name
    fill_in "Gardian phone", with: @emergency_contact.gardian_phone
    fill_in "Gardian relation", with: @emergency_contact.gardian_relation
    fill_in "Student", with: @emergency_contact.student_id
    fill_in "Token", with: @emergency_contact.token
    click_on "Update Emergency contact"

    assert_text "Emergency contact was successfully updated"
    click_on "Back"
  end

  test "should destroy Emergency contact" do
    visit emergency_contact_url(@emergency_contact)
    click_on "Destroy this emergency contact", match: :first

    assert_text "Emergency contact was successfully destroyed"
  end
end
