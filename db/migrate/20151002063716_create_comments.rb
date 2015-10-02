class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :shop_id
      t.string :text
      t.references :shop, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
