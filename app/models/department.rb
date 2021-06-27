class Department < ApplicationRecord
	validates :name, :active, presence: :true
end
