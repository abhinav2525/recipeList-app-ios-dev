//
//  ContentView.swift
//  recipeList
//
//  Created by Abhinav krishna on 01/06/21.
//

import SwiftUI

struct RecipeListView: View {
    
    //Reference the view model
    
    //@ObservedObject var model = RecipeModel()
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView{
            VStack(alignment: .leading){
                Text("All Recipies")
                    .bold()
                    .font(.largeTitle)
                    .padding(.top, 40.0)
                    .padding(.leading)
                
                ScrollView{
                    
                    LazyVStack (alignment: .leading){
                        
                        ForEach(model.recipes) { r in
                            
                            NavigationLink(
                                destination: RecipeDetailView(recipe: r),
                                label: {
                                    //MARK: row item
                                    HStack(spacing: 20.0){
                                        Image(r.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 50, alignment: .center)
                                            .clipped()
                                            .cornerRadius(5)
                                        Text(r.name)
                                            .foregroundColor(.black)
                                    }
                                    
                                })
                            
                        }
                        .navigationBarHidden(true) // it will eliminate the space that was produced by ListView
                    }
                    .padding(.leading)
                }
            }
            
        }
        
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecipeListView()
                .environmentObject(RecipeModel())
            
        }
    }
}
