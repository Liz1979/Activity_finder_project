class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :country
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
