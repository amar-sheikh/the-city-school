class EmergencyContact < ApplicationRecord
  belongs_to :student

  after_create :generate_token

  private

  def generate_token
    token = SecureRandom.urlsafe_base64
    update token: token
  end
end
