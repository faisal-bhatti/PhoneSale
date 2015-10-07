class AddSoldpriceToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :sold_price, :string
  end
end
