//
//  FavoriteMealsView.swift
//  themealdb
//
//  Created by Valid Mohammadi on 16.02.2024.
//

import SwiftUI
import CoreData

struct FavoriteMealsView: View {
    
    @FetchRequest(sortDescriptors: []) var favorittedMeals: FetchedResults<FavorittedMeal>
    @Environment(\.managedObjectContext) var moc
    
    
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(favorittedMeals) { meal in
                    NavigationLink(destination: mealDetailView(favorittedMeal: meal)) {
                        Text(meal.category ?? "Unknown")
                    }
                   
                    
                }
                .onDelete(perform: deleteMeal)
               
            }
            .navigationTitle("Favoritted Meals")
            
            
        }
    }
    
    func deleteMeal(at offsets: IndexSet){
        for index in offsets {
            let meal = favorittedMeals[index]
            moc.delete(meal)
        }
        do {
            try moc.save()
        }
        catch {
            print("Error deleting meal: \(error)")
        }
    }
    
    
}

#Preview {
    FavoriteMealsView()
}


