//
//  RecipeModel.swift
//  recipeList
//
//  Created by Abhinav krishna on 02/06/21.
//

import Foundation

class RecipeModel: ObservableObject{
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
        
        // set the recipe property
        }
    
    
   static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
    
    var portion = ""
    var numerator = ingredient.num ?? 1
    var denominator = ingredient.denom ?? 1
    var wholePortions = 0
    
    if ingredient.num != nil{
        
        // get a single serving size by multiplying numerator  by the recipe servings
        denominator *= recipeServings
        
        // get target portion by multiplying numerator by target servings
        numerator *= targetServings
        
        //reduce fraction by greatest common devisior
        let divisor = Rational.greatestCommonDivisor(numerator, denominator)
        numerator /= divisor
        denominator /= divisor
        
        //get the whole portion if numerator > denominator
        
        if numerator >= denominator {
            
            // calculated the whole portions
            wholePortions = numerator / denominator
            
            // calculated the remainder
            numerator = numerator % denominator
            
            //Assign to portion string
            portion += String(wholePortions)
            
        }
        
        //express the remainder as a fraction
        if numerator > 0 {
            //assign remainder as fraction to the portion string
            portion += wholePortions > 0 ? " ":""
            
            portion += "\(numerator)/\(denominator)"
        }
        
    }
    if var unit = ingredient.unit {
        
        // if we need to pluralize
        if wholePortions > 1 {
            // Calculate appropiate suffix
            if unit.suffix(2) == "ch"{
                unit = "es"
            }
            else if unit.suffix(1) == "f" {
                unit = String(unit.dropLast())
                unit += "ves"
            }
            else {
                unit += "s"
            }
        }
        
        portion += ingredient.num == nil && ingredient.num == nil ? "":" "
        return portion + unit
        
    }
         return portion
    }
    
    
}

