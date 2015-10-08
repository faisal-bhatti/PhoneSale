class AddColumnsToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :condition, :string
    add_column :phones, :comment, :string
    add_column :phones, :storage, :string
  end
end
