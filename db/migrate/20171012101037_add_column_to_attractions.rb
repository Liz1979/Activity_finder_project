class AddColumnToAttractions < ActiveRecord::Migration[5.1]
  def change
    change_table :attractions do |t|
      t.belongs_to :activity_type
    end
  end
end
