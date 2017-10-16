class AddAddressToLocation < ActiveRecord::Migration[5.1]
  def change
    change_table :locations do |t|
      t.string :address
    end
  end
end
