class PatientsController < ApplicationController
  before_action :set_patient, only: [:edit, :update, :destroy]

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(
      first_name: patient_params["first_name"],
      last_name: patient_params["last_name"],
      dob: Date.new(patient_params["dob(1i)"].to_i, patient_params["dob(2i)"].to_i, patient_params["dob(3i)"].to_i),
      gender: patient_params["gender"],
      address: patient_params["address"],
      phone: patient_params["phone"],
      identification: patient_params["identification"],
      email: patient_params["email"]
    )

    if @patient.valid?
      @patient.save
      add_allergies(@patient, patient_params["allergies"])
      add_medications(@patient, patient_params["medications"])
      add_surgeries(@patient, patient_params["surgeries"])

      flash.now[:success] = "El paciente ha sido creado exitosamente"
      redirect_to patients_path
    else
      render :new
    end
  end

  def update
    if @patient.update(
      first_name: patient_params["first_name"],
      last_name: patient_params["last_name"],
      dob: Date.new(patient_params["dob(1i)"].to_i, patient_params["dob(2i)"].to_i, patient_params["dob(3i)"].to_i),
      gender: patient_params["gender"],
      address: patient_params["address"],
      phone: patient_params["phone"],
      identification: patient_params["identification"],
      email: patient_params["email"]
    )

      add_allergies(@patient, patient_params["allergies"])
      add_medications(@patient, patient_params["medications"])
      add_surgeries(@patient, patient_params["surgeries"])

      flash.now[:success] = "Paciente editado existosamente"
      redirect_to patients_path
    else
      render :edit, patient: @patient
    end
  end

  def destroy
    @patient.destroy
    flash[:success] = "Paciente eliminado"
    redirect_to patients_path
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(
      :first_name,
      :last_name,
      :dob,
      :gender,
      :address,
      :phone,
      :identification,
      :email,
      :allergies,
      :medications,
      :surgeries,
    )
  end

  def add_allergies(patient, allergies)
    all_allergies = allergies&.strip&.split(',')
    all_allergies.each do |a|
      as = a.split(':')
      aa = patient.allergies.create!(name: as[0], severity: as[1].strip)
    end
  end

  def add_medications(patient, medications)
    all_medications = medications&.strip&.split(',')
    all_medications.each do |a|
      aa = patient.medications.create!(name: a.strip)
    end
  end

  def add_surgeries(patient, surgeries)
    all_surgeries = surgeries&.strip&.split(',')
    all_surgeries.each do |a|
      as = a.split(':')
      aa = patient.surgeries.create!(name: as[0], time: as[1].strip)
    end
  end
end
