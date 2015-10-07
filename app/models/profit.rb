class Profit < ActiveRecord::Base
  attr_accessible :amount, :phone_id, :user_id
  belongs_to :phone
end
