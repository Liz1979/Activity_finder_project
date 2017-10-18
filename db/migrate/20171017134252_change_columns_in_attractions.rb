class ChangeColumnsInAttractions < ActiveRecord::Migration[5.1]
  def change
    #remove_column :attractions, :activiy_types_id
    remove_column :attractions, :activity_type_id
    add_reference :attractions, :attractions_activity_types
  end
end
