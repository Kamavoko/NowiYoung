class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.references :category, index: true
      t.float :longitude
      t.float :latitude
      t.string :address
      t.string :homepage
      t.string :image

      t.timestamps null: false
    end
  end
end
