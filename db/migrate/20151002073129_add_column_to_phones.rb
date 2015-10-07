class AddColumnToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :status, :string
  end
end
