class AddBuyerNameToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :buyer, :string
    add_column :phones, :mobile, :string
  end
end
