require "test_helper"

class EmergencyContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @emergency_contact = emergency_contacts(:one)
  end

  test "should get index" do
    get emergency_contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_emergency_contact_url
    assert_response :success
  end

  test "should create emergency_contact" do
    assert_difference("EmergencyContact.count") do
      post emergency_contacts_url, params: { emergency_contact: { guardian_name: @emergency_contact.guardian_name, guardian_phone: @emergency_contact.guardian_phone, guardian_relation: @emergency_contact.guardian_relation, student_id: @emergency_contact.student_id, token: @emergency_contact.token } }
    end

    assert_redirected_to emergency_contact_url(EmergencyContact.last)
  end

  test "should show emergency_contact" do
    get emergency_contact_url(@emergency_contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_emergency_contact_url(@emergency_contact)
    assert_response :success
  end

  test "should update emergency_contact" do
    patch emergency_contact_url(@emergency_contact), params: { emergency_contact: { guardian_name: @emergency_contact.guardian_name, guardian_phone: @emergency_contact.guardian_phone, guardian_relation: @emergency_contact.guardian_relation, student_id: @emergency_contact.student_id, token: @emergency_contact.token } }
    assert_redirected_to emergency_contact_url(@emergency_contact)
  end

  test "should destroy emergency_contact" do
    assert_difference("EmergencyContact.count", -1) do
      delete emergency_contact_url(@emergency_contact)
    end

    assert_redirected_to emergency_contacts_url
  end
end
