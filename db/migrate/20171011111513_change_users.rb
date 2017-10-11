class ChangeUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :email
    change_table :users do |t|
      t.boolean :admin, default: false
    end
  end
end
