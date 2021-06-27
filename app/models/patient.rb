class Patient < ApplicationRecord
#   belongs_to :user

  validates :first_name, :email, :dob, presence: :true

  def full_name
    "#{first_name} #{last_name}"
  end

  def age
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
end
