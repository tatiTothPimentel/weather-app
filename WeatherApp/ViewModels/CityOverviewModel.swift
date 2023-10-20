import Combine
import SwiftUI

final class CityOverviewModel: ObservableObject {
    @Published var lat: Double
    @Published var long: Double
    @Published var name = ""
    @Published var time = ""
    @Published var date = ""
    
    @Published var weatherData: WeatherData?
    @Published var iconURL: URL = URL(string: "https://openweathermap.org/img/wn/10d@2x.png")!
    @Published var temp: String = ""
    @Published var description: String = ""
    @Published var feelsLike: String = ""
    @Published var pressure: String = ""
    @Published var humidity: String = ""
    @Published var windSpeed: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    let timeFormatter: DateFormatter = {
        let formatted = DateFormatter()
        formatted.dateFormat = "HH:mm"
        return formatted
    }()
    
    let dateFormatter: DateFormatter = {
        let formatted = DateFormatter()
        formatted.dateFormat = "EEE, MMM dd"
        return formatted
    }()
    
    init(city: City) {
        self.lat = city.lat
        self.long = city.lon
        self.name = city.name
        self.time = timeFormatter.string(from: Date())
        self.date = dateFormatter.string(from: Date())
        
        load()
    }
    
    func load() {
        WeatherService.getWeatherData(lat: lat, long: long)
            .sink { (completion) in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                    return
                case .finished: return
                }
            } receiveValue: { [weak self] (weatherData) in
                DispatchQueue.main.async {
                    self?.weatherData = weatherData
                    let icon = weatherData.current?.weather?.first?.icon ?? "10d"
                    self?.iconURL = URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png")!
                    self?.temp = "\(weatherData.current?.temp ?? 0.0)º"
                    self?.description = "\(weatherData.current?.weather?.first?.description ?? "")"
                    self?.feelsLike = "\(weatherData.current?.feelsLike ?? 0.0)º"
                    self?.pressure = "\(weatherData.current?.pressure ?? 0)"
                    self?.humidity = "\(weatherData.current?.humidity ?? 0)"
                    self?.windSpeed = "\(weatherData.current?.windSpeed ?? 0.0)"
                }
            }
            .store(in: &cancellables)
    }
    
}

