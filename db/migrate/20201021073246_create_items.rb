class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,             null: false
      t.text    :explanation,      null: false
      t.integer :category_id,      null: false
      t.integer :condition_id,     null: false
      t.integer :prefecture_id,    null: false
      t.integer :shipment_term_id, null: false
      t.integer :price,            null: false
      t.integer :shipment_fee_id,  null: false
      t.timestamps
    end
  end
end