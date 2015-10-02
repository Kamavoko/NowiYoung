class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.integer :shop_id
      t.string :image
      t.string :desc
      t.references :shop, index: true
      t.timestamps null: false
    end
  end
end
