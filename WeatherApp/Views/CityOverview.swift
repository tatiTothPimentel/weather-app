import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct CityOverview: View {
    @ObservedObject var model: CityOverviewModel
    
    init(city: City) {
        self.model = CityOverviewModel(city: city)
    }
    
    var body: some View {
        VStack(spacing: 22) {
            header
            
            currentWeather
            
            informationBox
            
            dailyForecast
            
            Spacer()
        }
    }
    private var header: some View {
        VStack {
            Text(model.name)
                .font(.title)
                .fontWeight(.semibold)
            Text(model.time)
                .font(.title3)
        }
    }
    
    private var currentWeather: some View {
        VStack {
            WebImage(url: model.iconURL)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
            
            Text(model.temp)
                .font(.system(size: 64))
            
            Text(model.description)
        }
        .foregroundColor(.white)
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 40)
                .fill(Color(red: 89/255, green: 77/255, blue: 180/255)
)
        )
        .overlay(
            Text(model.date)
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color.white)
                )
                .offset(y: -10)
            ,alignment: .top
        )
        .padding(.horizontal, 25)
        
    }
    private var informationBox: some View {
        HStack(spacing: 16) {
            ValueDescriptionStack(icon: "thermometer.sun.fill", boldText: $model.feelsLike, description: "Feels Like")
            ValueDescriptionStack(icon: "drop.fill", boldText: $model.humidity, description: "Humidity")
            ValueDescriptionStack(icon: "barometer", boldText: $model.pressure, description: "Pressure")
            ValueDescriptionStack(icon: "wind", boldText: $model.windSpeed, description: "Windspeed")
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
    private var dailyForecast: some View {
        VStack {
            HStack {
                Text("Today")
                
                Spacer()
                
                if model.weatherData != nil {
                    NavigationLink(destination: Next7DaysView(forecasts: model.weatherData?.daily ?? [], name: model.name)) {
                        Text("Next 7 Days")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(.primary)
                }
            }
            .font(Font.body.bold())
            .padding(.horizontal, 35)
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    Spacer()
                        .frame(width: 16)
                    
                    if model.weatherData != nil {
                        ForEach(model.weatherData?.hourly ?? [], id: \.dt) { forecast in
                            let url = URL(string: "https://openweathermap.org/img/wn/\(forecast.weather?.first?.icon ?? "10d")@2x.png")!

                            HourtyBox(time: model.timeFormatter.string(from: forecast.dt ?? Date()), icon: url, temp: "\(String(format: "%.1f", forecast.temp ?? 0.0))º")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
