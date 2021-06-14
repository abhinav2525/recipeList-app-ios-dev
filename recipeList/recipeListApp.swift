 //
//  recipeListApp.swift
//  recipeList
//
//  Created by Abhinav krishna on 01/06/21.
//

import SwiftUI

@main
struct recipeListApp: App {
    var body: some Scene {
        WindowGroup {
            RecipeTabView()
                .environmentObject(RecipeModel())
        }
    }
}
 
