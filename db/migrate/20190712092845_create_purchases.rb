class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.integer  :user_id
      t.integer  :product_id
      t.integer  :quantity
      t.datetime :purchase_date
      t.string   :info

      t.timestamps
    end
  end
end
