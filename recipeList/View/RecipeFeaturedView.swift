//
//  RecipeFeaturedView.swift
//  recipeList
//
//  Created by Abhinav krishna on 14/06/21.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var model:RecipeModel
    @State var isDetailedViewShowing = false
    @State var tabSelectionIndex = 0
    
   
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 0.0){
            Text("Featured Recipe")
                .bold()
                .font(Font.custom("Avenir Heavy", size: 24)) 
                .padding(.top, 40.0)
                .padding(.leading)
            
            GeometryReader { geo in
            
                TabView(selection: $tabSelectionIndex){
                    //Loop through each recipe
                    
                    ForEach(0..<model.recipes.count){ index in
                        //Only show thoes that should be featured
                        
                        if(model.recipes[index].featured == true){
                            
                            //recipe card button
                            
                            Button(action: {
                                // onclick show the recipe detailed sheet
                                
                                self.isDetailedViewShowing = true
                                
                            }, label: {
                                
                                //recipe card
                                ZStack{
                                    
                                    //used Zstack for placing the image on top of tapview
                                    
                                    Rectangle().foregroundColor(.white)
                                    
                                    VStack(spacing: 0.0){
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name).padding(5)
                                    }
                                }
                                
                            })
                            .tag(index)
                            .sheet(isPresented: $isDetailedViewShowing, content: {
                                //showning the recipe detailed view
                                RecipeDetailView(recipe: model.recipes[index])
                                
                            })
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(25)
                            .shadow(color: Color(.sRGB,red: 0, green: 0, blue: 0, opacity: 0.7), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -6, y: 7)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode:.always))
        }
            VStack(alignment: .leading, spacing: 5.0){
                Text("Preperation Time")
                    .font(Font.custom("Avenir Heavy", size: 16))
                Text(model.recipes[tabSelectionIndex].prepTime)
                    .font(Font.custom("Avenir", size: 15))
                Text("Highlights")
                    .font(Font.custom("Avenir Heavy", size: 16))
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
                    .font(Font.custom("Avenir", size: 15))
            }
            .padding([.leading, .bottom])
            
        }
        .onAppear(perform: {
            setFeaturedIndex()
        })
        
    }
        
    func setFeaturedIndex() {
        // find the index of first recipe that is featured
        var index = model.recipes.firstIndex { (recipe) -> Bool in
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
