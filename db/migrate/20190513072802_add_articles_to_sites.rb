class AddArticlesToSites < ActiveRecord::Migration[5.2]
  def change
    add_column :sites, :articles, :text
  end
end
