class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 10, scale: 0

      t.timestamps
    end
  end
end
