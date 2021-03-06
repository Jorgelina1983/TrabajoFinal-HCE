class AddDoctorsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
  		t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :identification, null: false
      t.string :email, null: false
      t.string :phone
      t.date :dob
      t.string :avatar
      t.references :users
      t.string :gender
      t.boolean :active
      t.string :description
      t.string :address


  		t.timestamps null: false
    end
  end
end
