//
//  LoadingView.swift
//  SwiftUI-WeatherApp-Sample
//
//  Created by ekayaint on 24.09.2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Text("Please wait a moment")
                .padding(5)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .black))
        }
    }
}

#Preview {
    LoadingView()
}
