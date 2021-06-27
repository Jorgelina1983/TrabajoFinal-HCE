class DepartmentsController < ApplicationController

  before_action :set_department, only: [:edit, :update, :destroy]
  def index
    @departments = Department.all
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)

    if @department.valid?
      @department.save
      flash[:success] = "El departamento ha sido creado exitosamente"
      redirect_to departments_path
    else
      render :new
    end
  end

  def update
    if @department.update(department_params)
			@department.update_attribute(:active, false) if (department_params.fetch(:active) == "Inactivo")

      flash[:success] = "Departamento editado existosamente"
      redirect_to departments_path
    else
      render :edit, doctor: @doctor
    end
  end

  def destroy
    @department.destroy
    flash[:success] = "Departamento eliminado"
    redirect_to departments_path
  end

  private

  def set_department
    @department = Department.find(params[:id])
  end

  def department_params
    params.require(:department).permit(
      :name,
      :description,
      :active,
    )
  end

end
