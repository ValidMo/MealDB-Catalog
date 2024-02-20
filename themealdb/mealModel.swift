//
//  mealModel.swift
//  themealdb
//
//  Created by Valid Mohammadi on 13.02.2024.
//

import Foundation

struct APIResponse: Codable {
    
    var categories: [Meal]
}

struct Meal: Codable, Hashable {
 
    var idCategory: String
    var strCategory: String
    var strCategoryDescription: String
}
