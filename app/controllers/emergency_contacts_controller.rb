class EmergencyContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ edit update ]
  before_action :set_emergency_contact_with_token, :check_accessibility, only: %i[ edit update ]
  before_action :set_emergency_contact, only: %i[ show destroy ]

  # GET /emergency_contacts or /emergency_contacts.json
  def index
    @emergency_contacts = EmergencyContact.all
  end

  # GET /emergency_contacts/1 or /emergency_contacts/1.json
  def show
  end

  # GET /emergency_contacts/new
  def new
    @emergency_contact = EmergencyContact.new
  end

  # GET /emergency_contacts/1/edit
  def edit
  end

  # POST /emergency_contacts or /emergency_contacts.json
  def create
    @emergency_contact = EmergencyContact.new(student_id: params[:student])
    respond_to do |format|
      if @emergency_contact.save
        format.html { redirect_back fallback_location: students_path, notice: "Emergency contact was successfully created." }
      else
        format.html { redirect_back fallback_location: students_path, notice: "Emergency contact form could not be generated." }
      end
    end
  end

  # PATCH/PUT /emergency_contacts/1 or /emergency_contacts/1.json
  def update
    respond_to do |format|
      if @emergency_contact.update(emergency_contact_params)
        format.html { redirect_to root_path, notice: "Emergency contact was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emergency_contacts/1 or /emergency_contacts/1.json
  def destroy
    @emergency_contact.destroy

    respond_to do |format|
      format.html { redirect_to emergency_contacts_url, notice: "Emergency contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emergency_contact
      @emergency_contact = EmergencyContact.find(params[:id])
    end

    def set_emergency_contact_with_token
      @emergency_contact = EmergencyContact.find_by(id: params[:id], token: params[:token])
    end

    def check_accessibility
      return if @emergency_contact

      redirect_to root_path, notice: "Your link has been expired! please contact the school admin."
    end

    # Only allow a list of trusted parameters through.
    def emergency_contact_params
      params.require(:emergency_contact).permit(:guardian_name, :guardian_relation, :guardian_phone)
    end
end
