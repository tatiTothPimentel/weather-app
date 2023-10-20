import SwiftUI

struct AddCityView: View {
    @ObservedObject var model: ContentViewModel
    
    var body: some View {
        VStack {
            Text("Weather app")
                .font(.title)
                .multilineTextAlignment(.center)
                .fontWeight(.semibold)
            
        TextField("New City", text: $model.newCityName)
            
            Button("Add City", action: model.addCity)
                .foregroundColor(.black)
                .font(Font.body.bold())
        }
        .padding()
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.white)
        )
        .padding(.horizontal, 10)
    }
}
