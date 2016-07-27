class RemoveImagesToUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :images
  	add_column :listings, :images, :json
  end
end
