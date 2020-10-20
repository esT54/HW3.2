//
//  ContentView.swift
//  HW3.2
//
//  Created by Семен on 19.10.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var valueSliderRed = 0.0
    @State private var valueSliderGreen = 0.0
    @State private var valueSliderBlue = 0.0
    
    var body: some View {
        VStack(spacing: 16) {
            
            Color(red: converValueForColor(value: valueSliderRed),
                  green: converValueForColor(value: valueSliderGreen),
                  blue: converValueForColor(value: valueSliderBlue))
                .frame(width: 350, height: 200)
                .cornerRadius(20)
            
            CellSliderUIView(value: $valueSliderRed)
            CellSliderUIView(value: $valueSliderGreen)
            CellSliderUIView(value: $valueSliderBlue)
            
            Spacer()
            
        }.padding()
    }
    func converValueForColor(value: Double) -> Double {
        value / 255.0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
