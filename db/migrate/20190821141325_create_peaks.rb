class CreatePeaks < ActiveRecord::Migration[5.2]
    def change
      create_table :peaks do |t|
        t.string :name
        t.string :location
        t.integer :elevation
        t.integer :elevation_gain
        t.integer :difficulty 
        t.string :review
        t.integer :user_id
        t.timestamps
      end
    end
  end
  