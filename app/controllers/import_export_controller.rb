class ImportExportController < ApplicationController
  before_action :set_doctor, only: [:edit, :update, :destroy]

  def new
    @patient = Patient.new
  end

  def create
    @patient = create_patient_from_fhir(import_export_params[:first_name])

    byebug
    if @patient.valid?
      @patient.save
      flash[:success] = "El paciente ha sido importado exitosamente"
      redirect_to export_path
    else
      flash[:success] = "El paciente no ha podido ser importado"
      render :new
    end
  end

  def show
    @patients = Patient.all
  end

  def export
    @patients = Patient.all
    id = params[:id].to_i

    @patient_value = Patient.find(id).to_hl7
  end

  private

  def create_patient_from_fhir(data)
    patient = Patient.new
    data_parsed =  JSON.parse(data)

    patient.first_name = data_parsed["name"][0]["given"][0]
    patient.last_name = data_parsed["name"][0]["family"]
    patient.dob = data_parsed["birthDate"]
    patient.gender = data_parsed["gender"]
    patient.phone = data_parsed["telecom"][1]["value"]
    patient.address = data_parsed["address"][0]["line"][0]
    patient.email = data_parsed["telecom"][2]["value"]
    patient.identification = data_parsed["identifier"][0]["value"]

    patient
  end

  def import_export_params
    params.require(:patient).permit(
      :first_name
    )
  end

end
