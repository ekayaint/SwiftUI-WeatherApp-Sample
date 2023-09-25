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
                        
                    }
                } //: VStack
                .padding()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            } //: ZStack
            .onAppear{
                isAnimating = true
            }
            .ignoresSafeArea(edges:[.bottom])
            .background(.white)
        } //: Nav
    }
}

 
