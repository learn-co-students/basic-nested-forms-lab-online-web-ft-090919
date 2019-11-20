class Recipe < ActiveRecord::Base
  has_many :ingredients 
  accepts_nested_attributes_for :ingredients #allows rails todo the heavy lifting and write _attr for us 
end
