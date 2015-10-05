class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image
      t.string :desc
      t.references :shop, index: true
      t.references :user, index: true
      t.timestamps null: false
    end
  end
end
