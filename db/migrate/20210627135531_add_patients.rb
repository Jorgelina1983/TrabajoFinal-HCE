class AddPatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
  		t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :identification, null: false
      t.string :email, null: false
      t.string :phone
      t.date :dob
      t.references :user
      t.string :gender
      t.string :address


  		t.timestamps null: false
    end
  end
end
