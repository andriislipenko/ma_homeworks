class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.float :price, scale: 2
      t.string :image_url
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
