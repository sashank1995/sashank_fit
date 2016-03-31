class CreateDiseaseTreatments < ActiveRecord::Migration
  def change
    create_table :disease_treatments do |t|
      t.string :medicine
      t.string :food
      t.string :activities

      t.timestamps null: false
    end
  end
end
