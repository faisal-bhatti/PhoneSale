class Phone < ActiveRecord::Base
  attr_accessible :buyer,:mobile,:brand, :color, :emei, :price, :slod_by, :sold_date,:sold_price,:comment,:storage,:condition
  
  # has_many :photos, :autosave => true
  # accepts_nested_attributes_for :photos, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  
  has_one :profit
end
