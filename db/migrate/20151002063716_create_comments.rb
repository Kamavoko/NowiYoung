class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.references :shop, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
