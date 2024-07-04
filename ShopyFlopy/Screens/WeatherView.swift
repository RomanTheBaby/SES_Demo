//
//  WeatherView.swift
//  ShopyFlopy
//
//  Created by Roman on 2024-06-07.
//

import SwiftUI

struct WeatherView: View {
    
    var weatherInformation: WeatherInformation

//    @State private var location: String = ""

    var body: some View {
        ZStack {
            // Setting up background color
            Color.blue.opacity(0.5).ignoresSafeArea()
            
            VStack {
                // Task?
                //            TextField("location", text: $location)
                //                .padding()
                //                .background(Color.gray.opacity(0.2))
                //                .cornerRadius(5)
                //                .padding()
                
                Text("TODAY") // Task capitalized
                    .fontWeight(.bold)
                    .font(.largeTitle) // task
                    .tracking(5) // task
                
//                Spacer() // Task
                
                Image(systemName: "globe")
                    .padding(.top, 24)
                
                Spacer()
                
                HStack {
                    Text(weatherInformation.temperature)
                        .font(.largeTitle) // task
                        .fontWeight(.bold)
                    
                    VStack {
                        Text(weatherInformation.title)
                            .frame(alignment: .leading)
                            .fontWeight(.heavy) // task
                        Text(weatherInformation.description) // lines count text
                    }
                }
                
                //            Spacer() // Task
                Divider() // Task
                
                if let items = weatherInformation.hourlyData {
                    HStack(spacing: 16) {
                        ForEach(Array(zip(items.indices, items)), id: \.0) { _, item in
                            WeatherCardView(hourlyInfomation: item)
                        }
                    }
                } else {
                    VStack {
                        Text("No hourly data to display") // Task - Error message
                        Button(action: {}, label: {
                            HStack {
                                Image(systemName: "arrow.counterclockwise")
                                Text("Button")
                            }
                        })
                    }
                    .padding() // task
                }
            }
        }
    }
}

struct WeatherCardView: View {
    var time: String
    var imageName: String
    var temperature: String
    
    init(time: String, imageName: String, temperature: String) {
        self.time = time
        self.imageName = imageName
        self.temperature = temperature
    }
    
    init(hourlyInfomation: WeatherInformation.HourlyData) {
        self.time = hourlyInfomation.time
        self.imageName = hourlyInfomation.imageName
        self.temperature = hourlyInfomation.temperature
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Text(time)
            Image(systemName: imageName)
            Text(temperature)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                    .stroke(.black, lineWidth: 1)
        )
    }
}

#Preview {
    WeatherView(
        weatherInformation: WeatherInformation(cityName: "City", temperature: "20°", title: "Partly cloudly", description: "Slightly Humid with gentle breeze of morning tired sun cause it's monday")
    )
}
