class PatientsController < ApplicationController
  before_action :set_patient, only: [:edit, :update, :destroy]

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.valid?
      @patient.save
      flash[:success] = "El paciente ha sido creado exitosamente"
      redirect_to patients_path
    else
      render :new
    end
  end

  def update
    if @patient.update(patient_params)
      flash[:success] = "Pacient editado existosamente"
      redirect_to patients_path
    else
      render :edit, patient: @patient
    end
  end

  def destroy
    byebug
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
      :email
    )
  end

end
