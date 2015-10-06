class CreateShopTags < ActiveRecord::Migration
  def change
      create_table :shop_tags, id: false do |t|
      t.references :shop, index: true, null: false
      t.references :tag, index: true, null: false
    end
  end
end
