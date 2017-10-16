class CreateJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :locations, :attractions do |t|
      t.index [:location_id, :attraction_id]
      t.index [:attraction_id, :location_id]
    end
  end
end
