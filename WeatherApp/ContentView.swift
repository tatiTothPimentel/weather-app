//
import SwiftUI

struct ContentView: View {
    @StateObject var model = ContentViewModel()
    
    var body: some View {
        NavigationView {
            TabView {
                AddCityView(model: model)
                ForEach(model.cities) { city in
                    CityOverview(city: city)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .navigationBarHidden(true)
            .background(
                Color.purple
                    .opacity(0.1)
                    .ignoresSafeArea()
            )
        }
    }
}

#Preview {
    ContentView()
}
