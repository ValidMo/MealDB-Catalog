//
//  themealdbApp.swift
//  themealdb
//
//  Created by Valid Mohammadi on 12.02.2024.
//

import SwiftUI

@main
struct themealdbApp: App {
    
    @StateObject private var dataController = DataController()
    
    var network = Network()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(network)
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
