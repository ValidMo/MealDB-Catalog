//
//  networkController.swift
//  themealdb
//
//  Created by Valid Mohammadi on 16.02.2024.
//

import Foundation


class Network: ObservableObject {
    @Published var meals: [Meal] = []
    
     func getMeals() async throws {
     
            var components = URLComponents()
            components.scheme = "https"
            components.host = "www.themealdb.com"
            components.path = "/api/json/v1/1/categories.php"
        
            //https://www.themealdb.com/api/json/v1/1/categories.php
        
            guard let url = components.url else {
                throw URLError(.badURL)
            }

          let urlRequest = URLRequest(url: url)
          let (data, response) = try await URLSession.shared.data(for: urlRequest)

          guard let response = response as? HTTPURLResponse else {
            throw URLError(.cannotFindHost)
          }

          guard response.statusCode == 200 else {
            throw URLError(.badServerResponse)
          }

          let decodedMeals = try JSONDecoder().decode(APIResponse.self, from: data)
          DispatchQueue.main.async {
          
              self.meals = decodedMeals.categories
          }
          //  print(decodedMeals)
          //  print(self.meals.count)
        }
    }
    
