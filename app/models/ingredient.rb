class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  accepts_nested_attributes_for :ingredients
end
