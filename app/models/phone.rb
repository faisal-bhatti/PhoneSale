class Phone < ActiveRecord::Base
  attr_accessible :brand, :color, :emei, :price, :slod_by, :sold_date,:sold_price

  has_one :profit
end
