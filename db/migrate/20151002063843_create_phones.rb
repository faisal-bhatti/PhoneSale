class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :emei
      t.string :color
      t.string :price
      t.string :brand
      t.string :slod_by
      t.datetime :sold_date

      t.timestamps
    end
  end
end
