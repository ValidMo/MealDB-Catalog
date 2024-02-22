//
//  FavorittedMeal+CoreDataProperties.swift
//  themealdb
//
//  Created by Valid Mohammadi on 22.02.2024.
//
//

import Foundation
import CoreData


extension FavorittedMeal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavorittedMeal> {
        return NSFetchRequest<FavorittedMeal>(entityName: "FavorittedMeal")
    }

    @NSManaged public var category: String?
    @NSManaged public var desc: String?
    @NSManaged public var id: String?
    @NSManaged public var isFavorited: Bool
    @NSManaged public var image: String?

}

extension FavorittedMeal : Identifiable {

}
