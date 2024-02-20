//
//  mealDetailView.swift
//  themealdb
//
//  Created by Valid Mohammadi on 15.02.2024.
//

import SwiftUI
import CoreData

struct mealDetailView: View {
    
    @FetchRequest(sortDescriptors: []) var favorittedMeals: FetchedResults<FavorittedMeal>
    @Environment(\.managedObjectContext) var moc
    
    var meal: Meal?
    var favorittedMeal: FavorittedMeal?
    
    
    var body: some View {
        VStack{
            if let meal = meal {
                Text(meal.strCategoryDescription)
            }
            
            if let favorittedMeal = favorittedMeal {
                Text(favorittedMeal.desc ?? "")
            }
            
            Button("Add to Favorites") {
                
                if (!favorittedMeals.contains(where: {$0.id == meal?.idCategory}))
                {
                    
                    let newFavoriteMeal: FavorittedMeal = FavorittedMeal(context: moc)
                    newFavoriteMeal.id = meal?.idCategory
                    newFavoriteMeal.category = meal?.strCategory
                    newFavoriteMeal.desc = meal?.strCategoryDescription
                    newFavoriteMeal.isFavorited = true
                    
                    
                    do {
                        try moc.save()
                        
                    }
                    catch {
                        print("Error adding the meal to favorites!")
                    }
                }
                else {
                    print("The meal is already in your favorite list!")
                }
                
            }
            .disabled(check() || favorittedMeals.contains(where: {$0.id == meal?.idCategory}))
            
            
        }
        
        
    }
    
    func deleteFromFavorites(meal: FavorittedMeal){
        
        moc.delete(meal)
        
        do {
            try moc.save()
        }
        catch{
            print("Error while deleting from favorites list: ")
        }
    }
    
    func check() -> Bool {
        if meal == nil {
            return true
        }
        return false
    }
}


