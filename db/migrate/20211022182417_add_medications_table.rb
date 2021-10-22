class AddMedicationsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :medications do |t|
      t.references :patient
      t.string :name

      t.timestamps
    end

  end
end
