class AddPhotoUrlToAttractions < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :photo_url, :string
  end
end
