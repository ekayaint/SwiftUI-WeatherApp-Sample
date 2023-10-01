//
//  WeatherManager.swift
//  SwiftUI-WeatherApp-Sample
//
//  Created by ekayaint on 24.09.2023.
//

import Foundation
import CoreLocation

class WeatherManager {
     
    
    func getWeatherData(for coordinate: CLLocationCoordinate2D, completion: @escaping (Result<WeatherResponse, WeatherError>) -> Void) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinate.latitude)&lon=\(coordinate.longitude)&appid=\(Keys.apiKey)&units=metric") else {
            completion(.failure(WeatherError.invalidURL))
                   return
               }
        //print(url)
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(WeatherError.invalidData))
                return
            }
           /* let string = String(data: data, encoding: .utf8)!
            print("Data as JSON: ")
            print(string) // Prints the actual JSON String.*/
            do {
                let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                completion(.success(weatherResponse))
            } catch {
                completion(.failure(.invalidData))
            }
        } //: UrlSession
        .resume()
        
    }
}

enum WeatherError: Error {
    case invalidURL
    case invalidData
}

struct WeatherResponse: Decodable {
    var weather: [WeatherDetails]
    var main: MainResponse
    var name: String
    var wind: WindResponse
    var sys: Country
    
    
    struct WeatherDetails: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }
    
    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
    }
    
    struct Country: Decodable {
        var country: String
    }
    
    var conditionName: String {
        guard let firstWeather = weather.first else { return "cloud"}
        switch firstWeather.id {
        case 200...232:
            return "cloud.bolt"
        case 300.321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
    
}

extension WeatherResponse.MainResponse {
    var tempMin: Double {
        return temp_min
    }
    
    var tempMax: Double {
        return temp_max
    }
}
