class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:edit, :update, :destroy]

	def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.valid?
      @appointment.save
      flash[:success] = "La consulta ha sido creada exitosamente"
      redirect_to appointments_path
    else
      render :new
    end
  end

  def update
    if @appointment.update(appointment_params)
      flash[:success] = "Consulta editada existosamente"
      redirect_to appointments_path
    else
      render :edit, appointment: @appointment
    end
  end

  def destroy
    @appointment.destroy
    flash[:success] = "Consulta eliminada"
    redirect_to appointments_path
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(
      :name,
      :notes,
			:date,
			:time,
			:duration,
			:patient_id,
			:doctor_id,
			:department_id,
      :status,
    )
  end
end

