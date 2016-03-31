class AddDiseaseIdToDiseaseTreatments < ActiveRecord::Migration
  def change
    add_column :disease_treatments, :disease_id, :integer
  end
end
