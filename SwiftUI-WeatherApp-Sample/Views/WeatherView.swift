//
//  WeatherView.swift
//  SwiftUI-WeatherApp-Sample
//
//  Created by ekayaint on 25.09.2023.
//

import SwiftUI

struct WeatherView: View {
    @State var weather: WeatherResponse
    @State private var isAnimating = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .leading) {
                VStack {
                    
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("\(weather.name), \(weather.sys.country)")
                            .foregroundStyle(.black)
                            .bold()
                            .font(.title)
                        Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                            .fontWeight(.light)
                            .foregroundStyle(.black)
                    } //: VStack
                    .frame(maxWidth: .infinity, alignment: .leading)
                } //: VStack
                .padding()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding(10)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack (spacing: 20) {
                            Image(systemName: weather.conditionName)
                                .foregroundStyle(.black)
                                .font(.system(size: 40))
                            Text(weather.weather[0].description.capitalized)
                        } //: VStack
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.temp.roundDouble() + "°")
                            .font(.system(size: 100))
                            .bold()
                            .padding()
                            .foregroundStyle(.black)
                    
                    } //: HStack
                    
                    Image("turkey-collage-concept")
                        .resizable()
                        .cornerRadius(15)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 250)
                        .ignoresSafeArea()
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y: isAnimating ? 0 : -40)
                        .animation(.easeOut, value: isAnimating)
                    
                    Spacer()
                    
                } //: VStack
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    Spacer()
                    Divider()
                    VStack(alignment: .leading, spacing: 20) {
                       Text("Weather Now")
                            .bold()
                            .padding(.bottom)
                            .foregroundStyle(.black)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                WeatherRow(logo: "thermometer", name: "Min temp", value: weather.main.tempMin.roundDouble() + "°")
                                WeatherRow(logo: "thermometer", name: "Max temp", value: weather.main.tempMax.roundDouble() + "°")
                                WeatherRow(logo: "wind", name: "Wind speed", value: weather.wind.speed.roundDouble() + "m/s")
                                WeatherRow(logo: "humidity", name: "Humidity", value: weather.main.humidity.roundDouble() + "%")
                            } //: HStack
                        } //: ScrollView
                        Spacer()
                    } //: VStack
                    .frame(maxWidth: .infinity, maxHeight: 125, alignment: .leading)
                    .padding()
                    .padding(.bottom, 20)
                           
                } //: VStack
                
            } //: ZStack
            .onAppear{
                isAnimating = true
            }
            .ignoresSafeArea(edges:[.bottom])
            .background(.white)
        } //: Nav
    }
}

 
