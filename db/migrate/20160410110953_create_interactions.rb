class CreateInteractions < ActiveRecord::Migration
  def change
    create_table :interactions do |t|
      t.text :matter
      t.integer :usable_id
      t.string :usable_type

      t.timestamps null: false
    end
  end
end
