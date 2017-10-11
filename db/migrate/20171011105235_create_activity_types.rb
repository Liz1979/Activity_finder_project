class CreateActivityTypes < ActiveRecord::Migration[5.1]
  def change
    change_table :activity_types do |t|

      t.timestamps
    end
  end
end
