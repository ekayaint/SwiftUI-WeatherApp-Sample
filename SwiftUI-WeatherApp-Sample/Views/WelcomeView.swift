//
//  WelcomeView.swift
//  SwiftUI-WeatherApp-Sample
//
//  Created by ekayaint on 23.09.2023.
//

import SwiftUI
import CoreLocationUI


struct WelcomeView: View {
    @ObservedObject var locationManager: LocationManager
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            BlobShape()
                .frame(width: 400, height: 425)
                .foregroundStyle(.linearGradient(colors: [.pink, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 4), value: isAnimating)
            
            VStack {
                VStack ( spacing: 20) {
                    Text("Welcome to the Weather App")
                        .bold()
                        .font(.title)
                        
                    Text("Share your present location to retrieve the weather information for your area")
                        .padding()
                } //: VStack
                .multilineTextAlignment(.center)
                .padding()
                .foregroundStyle(Color.white)
                
                LocationButton(.shareCurrentLocation) {
                    locationManager.requestLocation()
                }
                .cornerRadius(30)
                .symbolVariant(/*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color.white)
                
            } //: VStack
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        } //: ZStack
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

#Preview {
    WelcomeView(locationManager: LocationManager())
}
