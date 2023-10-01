//
//  ContentView.swift
//  SwiftUI-WeatherApp-Sample
//
//  Created by ekayaint on 23.09.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    private var weatherManager = WeatherManager()
    @State var weather: WeatherResponse?
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weather = weather {
                    //Text("Weather data loaded")
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            weatherManager.getWeatherData(for: location) { result in
                                switch result {
                                    
                                case .success(let weather):
                                    self.weather = weather
                                case .failure(let error):
                                    print( "Error while getting data, \(error)")
                                } //: switch
                            }
                        } //: task
                } //: if else
                
            } else {
                if locationManager.isLoading {
                    LoadingView()
                }
                else {
                    WelcomeView(locationManager: locationManager)
                }
            }
            
           
        }
         
    }
}

#Preview {
    ContentView()
}
