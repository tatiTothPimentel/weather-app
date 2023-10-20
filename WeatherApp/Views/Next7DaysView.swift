import SwiftUI

struct Next7DaysView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var forecasts: [WeatherData.Daily]
    @State var name: String
    
    let dateFormatter: DateFormatter = {
        let formatted = DateFormatter()
        formatted.dateFormat = "dd.MM."
        return formatted
    }()
    
    var body: some View {
        ScrollView {
            navigationBar
            
            Text(name)
                .font(.title)
                .fontWeight(.semibold)
            
            Spacer()
                .frame(height: 50)
            
            VStack(spacing: 16) {
                ForEach(forecasts, id: \.dt) { forecast in
                    let maxTemperature = String(format: "%.1f", forecast.temp?.max ?? 0.0)
                    let minTemperature = String(format: "%.1f", forecast.temp?.min ?? 0.0)
                    
                    DailyForecastView(date: dateFormatter.string(from: forecast.dt ?? Date()), icon: forecast.weather?.first?.icon ?? "10d", high: "\(maxTemperature)º", low: "\(minTemperature)º")
                }
            }
            .padding()
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color(red: 89/255, green: 77/255, blue: 180/255))
            )
            .padding(.horizontal, 10)
            
            Spacer()
        }
        .navigationBarHidden(true)
        .background(
            Color(red: 89/255, green: 77/255, blue: 180/255)
                .opacity(0.1)
                .ignoresSafeArea()
        )
    }
    private var navigationBar: some View {
        HStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Back")
                }
            }
            .foregroundColor(.primary)
            
            Spacer()
        }
        .padding()
    }
}
