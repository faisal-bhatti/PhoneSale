class CreateProfits < ActiveRecord::Migration
  def change
    create_table :profits do |t|
      t.integer :phone_id
      t.integer :user_id
      t.string :amount

      t.timestamps
    end
  end
end
