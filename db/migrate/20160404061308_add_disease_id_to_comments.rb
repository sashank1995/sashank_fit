class AddDiseaseIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :disease_id, :integer
  end
end
