class AddSurgeriesTable < ActiveRecord::Migration[6.1]
  def change
    create_table :surgeries do |t|
      t.references :patient
      t.string :name
      t.date :time
      t.string :doctor

      t.timestamps
    end

  end
end
