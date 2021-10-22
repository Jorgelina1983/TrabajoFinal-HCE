class AddAllergiesTable < ActiveRecord::Migration[6.1]
  def change
    create_table :allergies do |t|
      t.references :patient
      t.string :name
      t.string :severity

      t.timestamps
    end

  end
end
