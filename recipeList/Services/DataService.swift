//
//  DataService.swift
//  recipeList
//
//  Created by Abhinav krishna on 02/06/21.
//

import Foundation

class DataService {
    
   static func getLocalData() ->[Recipe] {
        
        // parse local json file
        
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        // check if pathString is not nil, otherwise...
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do{
            // Create data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
           
            do{
                let recipeData = try decoder.decode([Recipe].self , from: data)
                
                // Add the unique IDs
                for r in recipeData {
                    r.id = UUID()
                }
                // Return the recipes
                return recipeData
            }
            catch{
                //error with parsing Json
                print(error)
                
            }
            
        }
        catch{
            // error with getting data
            print(error)
        }
        
        return [Recipe]()
        
    }
    
    
}
