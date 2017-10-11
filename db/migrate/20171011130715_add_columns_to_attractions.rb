class AddColumnsToAttractions < ActiveRecord::Migration[5.1]
  def change
    change_table :attractions do |t|
      t.string :name
      t.float :longitude
      t.float :latitude
      t.text :speciality
    end
  end
end
