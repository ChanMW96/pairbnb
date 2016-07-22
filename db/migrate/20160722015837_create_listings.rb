class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.string :location
      t.integer :price
      t.integer :max_pax

      t.timestamps null: false
    end
  end
end
