class ImportExportController < ApplicationController
  before_action :set_doctor, only: [:edit, :update, :destroy]

  def index

  end

  def new

  end

  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.valid?
      @doctor.save
      flash[:success] = "El doctor ha sido creado exitosamente"
      redirect_to doctors_path
    else
      render :new
    end
  end

  def update
    if @doctor.update(doctor_params)
			@doctor.update_attribute(:active, false) if (doctor_params.fetch(:active) == "Inactivo")

      flash[:success] = "Doctor editado existosamente"
      redirect_to doctors_path
    else
      render :edit, doctor: @doctor
    end
  end

  def destroy
    @doctor.destroy
    flash[:success] = "Doctor eliminado"
    redirect_to doctors_path
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
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
