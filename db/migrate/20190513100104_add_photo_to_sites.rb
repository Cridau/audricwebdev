class AddPhotoToSites < ActiveRecord::Migration[5.2]
  def change
    add_column :sites, :photo, :string
  end
end
