class AddColumnToLocation < ActiveRecord::Migration[5.1]
  def change
    change_table :attractions do |t|
      t.string :place_id
    end
  end
end
