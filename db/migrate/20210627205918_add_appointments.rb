class AddAppointments < ActiveRecord::Migration[6.1]
  def change
		 create_table :appointments do |t|
  		t.string :name
      t.string :notes, null: false
			t.date :date, null: false
			t.string :time, null: false
			t.integer :duration, null: false
			t.references :patient, null: false
			t.references :doctor, null: false
			t.references :department, null: false
      t.string :status, null: false

  		t.timestamps null: false
    end
  end
end
