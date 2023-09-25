//
//  BlobShape.swift
//  SwiftUI-WeatherApp-Sample
//
//  Created by ekayaint on 24.09.2023.
//

import SwiftUI

struct BlobShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.99946*width, y: 0.38012*height))
        path.addCurve(to: CGPoint(x: 0.48571*width, y: height), control1: CGPoint(x: 0.99946*width, y: 0.6167*height), control2: CGPoint(x: 0.69019*width, y: height))
        path.addCurve(to: CGPoint(x: 0.00058*width, y: 0.2924*height), control1: CGPoint(x: 0.28124*width, y: height), control2: CGPoint(x: 0.00058*width, y: 0.52898*height))
        path.addCurve(to: CGPoint(x: 0.50415*width, y: 0.03216*height), control1: CGPoint(x: 0.00058*width, y: 0.05582*height), control2: CGPoint(x: 0.35296*width, y: 0.14328*height))
        path.addCurve(to: CGPoint(x: 0.99946*width, y: 0.38012*height), control1: CGPoint(x: 0.65534*width, y: -0.07895*height), control2: CGPoint(x: 0.99946*width, y: 0.14354*height))
        path.closeSubpath()
        return path
    }
}

#Preview {
    BlobShape()
}
