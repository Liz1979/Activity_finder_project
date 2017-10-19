class RemovePhotoUrlFromLocations < ActiveRecord::Migration[5.1]
  def change
    remove_column :locations, :photo_url
    add_column :attractions, :photo_url, :string
  end
end
