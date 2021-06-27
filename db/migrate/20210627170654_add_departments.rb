class AddDepartments < ActiveRecord::Migration[6.1]
  def change
    create_table :departments do |t|
  		t.string :name, null: false
      t.string :description, null: false
      t.boolean :active, null: false

  		t.timestamps null: false
    end
  end
end
