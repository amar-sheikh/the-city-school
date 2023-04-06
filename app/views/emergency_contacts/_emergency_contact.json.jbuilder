json.extract! emergency_contact, :id, :guardian_name, :guardian_relation, :guardian_phone, :token, :student_id, :created_at, :updated_at
json.url emergency_contact_url(emergency_contact, format: :json)
