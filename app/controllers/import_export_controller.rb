class ImportExportController < ApplicationController
  before_action :set_doctor, only: [:edit, :update, :destroy]

  def index

  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = create_patient_from_fhir(import_export_params)

    if @doctor.valid?
      @doctor.save
      flash[:success] = "El doctor ha sido creado exitosamente"
      redirect_to doctors_path
    else
      render :new
    end
  end

  def update
  end

  def show
    @patients = Patient.all
  end

  def destroy
  end

  def export
  end

  private

  def set_doctor
  end

  def doctor_params
    params.require(:doctor).permit(
      :first_name,
      :last_name,
      :dob,
      :gender,
      :address,
      :active,
      :phone,
      :description,
      :avatar,
      :identification,
      :email
    )
  end

end
