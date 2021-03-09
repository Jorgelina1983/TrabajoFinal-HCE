class DoctorsController < ApplicationController

  PROVINCES = %w[Bs. As., Catamarca, Chaco, Chubut, Cordoba, Corrientes, Entre Rios, Formosa, Jujuy, La Pampa, La Rioja, Mendoza, Misiones, Neuquen, Rio Negro, Salta, San Juan, San Luis, Santa Cruz, Santa Fe, Sgo. del Estero, Tierra del Fuego, Tucuman].freeze

  def index
    @doctors = Doctor.all
  end

  def new
    @provinces = PROVINCES
    @doctor = Doctor.new
  end

  def create
    byebug
  end

  def update
  end

  def edit
  end

end


