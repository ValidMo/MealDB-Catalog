//
//  dataController.swift
//  themealdb
//
//  Created by Valid Mohammadi on 16.02.2024.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "mealData")
    
    init() {
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Error loading data: \(error.localizedDescription)")
            }
        }
    }
}
