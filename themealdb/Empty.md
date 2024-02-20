//
//  MainView.swift
//  Pitch
//
//  Created by Valid Mohammadi on 3.02.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        TabView {
            // First Tab
            Text("First Tab")
                .tabItem {
                    Image(systemName: "list.bullet.indent")
                    Text("Table")
                }
                .tag(0)
            
            
            
            
            FormationsListView()
                .tabItem {
                    Image(systemName: "star")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 4, height: 4)
                    Text("My Formations")
                }
                .tag(2)
        }
        .onAppear {
            UITabBar.appearance().isTranslucent = true
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    
}

#Preview {
    MainView()
}

