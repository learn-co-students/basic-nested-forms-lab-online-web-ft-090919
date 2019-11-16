class Recipe < ActiveRecord::Base
  has_many :ingredients 
  accepts_nested_attributes_for :ingredients

 
  # def ingredients_attributes=(ingredients)
  #   self.ingredients = ingredients.find_or_create_by(title: ingredients[:title])
  #   self.ingredients.update(ingredients)
  # end

  #  accepts_nested_attributes_for :ingredients, :reject_if => proc { |attributes| attributes[:title].blank? }


end
