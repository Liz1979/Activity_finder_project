class AddColumnnToAttractions < ActiveRecord::Migration[5.1]
  def change
    change_table :attractions do |t|
      t.belongs_to :activiy_types
    end
  end
end
