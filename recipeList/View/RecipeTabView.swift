//
//  RecipeTabView.swift
//  recipeList
//
//  Created by Abhinav krishna on 03/06/21.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView{
            RecipeFeaturedView()
                .tabItem {
                VStack{
                    Image(systemName: "star.fill")
                    Text("Featured")
                }
            }
            RecipeListView()
                .tabItem {
                VStack{
                    Image(systemName: "list.bullet")
                    Text("List")
                    
                }
            }
        }.environmentObject(RecipeModel()) //this recipemodel data can be accessed ,when a child is connected to parent
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
