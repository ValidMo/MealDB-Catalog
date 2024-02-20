import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var network: Network
    @State private var isShowingFavorites = false
    
    
    var body: some View {
        
    
        TabView{
            
            NavigationStack{
                
                List(network.meals, id: \.self){ meal in
                    
                    NavigationLink(meal.strCategory, destination: mealDetailView(meal: meal))
                }
                .navigationTitle("Meals")
                
                
            }
            .onAppear{
                Task {
                    await loadData()
                }
            }
            .tabItem{
                Label("Meals", systemImage: "list.bullet")
            }
            .tag(0)
            
            FavoriteMealsView()
                .tabItem{
                    Label("Favorites", systemImage: "square.and.pencil")
                }
                .tag(1)
            
            
            
        }
            
        
    }
    
    
    func loadData() async {
        do {
            try await network.getMeals()
        }
        catch {
            print("Error fetching meals:", error)
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Network())
    }
}




