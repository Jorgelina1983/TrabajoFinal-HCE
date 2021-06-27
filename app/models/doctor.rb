class Doctor < ApplicationRecord
  # belongs_to :user

  has_one_attached :avatar
  validates :first_name, :email, :dob, presence: :true

  def full_name
    "#{first_name} #{last_name}"
  end
end
