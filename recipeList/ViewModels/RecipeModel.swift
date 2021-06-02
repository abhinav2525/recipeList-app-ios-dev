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
    
    
}

