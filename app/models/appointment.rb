class Appointment < ApplicationRecord
	belongs_to :patient
	belongs_to :doctor
	belongs_to :department

	STATUSES = %w[Pendiente Iniciada Terminada Cancelada].freeze

	validates :date, :time, :duration, :patient_id, :department_id, :doctor_id, :status, presence: :true
end

