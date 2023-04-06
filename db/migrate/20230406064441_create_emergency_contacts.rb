class CreateEmergencyContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :emergency_contacts do |t|
      t.string :guardian_name
      t.string :guardian_relation
      t.string :guardian_phone
      t.string :token
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
