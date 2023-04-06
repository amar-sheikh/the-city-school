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

    fill_in "Guardian name", with: @emergency_contact.guardian_name
    fill_in "Guardian phone", with: @emergency_contact.guardian_phone
    fill_in "Guardian relation", with: @emergency_contact.guardian_relation
    fill_in "Student", with: @emergency_contact.student_id
    fill_in "Token", with: @emergency_contact.token
    click_on "Create Emergency contact"

    assert_text "Emergency contact was successfully created"
    click_on "Back"
  end

  test "should update Emergency contact" do
    visit emergency_contact_url(@emergency_contact)
    click_on "Edit this emergency contact", match: :first

    fill_in "Guardian name", with: @emergency_contact.guardian_name
    fill_in "Guardian phone", with: @emergency_contact.guardian_phone
    fill_in "Guardian relation", with: @emergency_contact.guardian_relation
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
