class CreateActivityType < ActiveRecord::Migration[5.1]
  def change
    create_table :activity_types do |t|
      t.string :name
    end
  end
end
