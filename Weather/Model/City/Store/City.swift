//
//  City.swift
//  Weather
//
//  Created by Lunabee on 12/06/2019.
//  Copyright © 2019 Snopia. All rights reserved.
//

import SwiftUI
import Combine

class City: BindableObject {
    
    var didChange = PassthroughSubject<City, Never>()
    
    var name: String
    var longitude: Double
    var latitude: Double
    var weather: Weather? {
        didSet {
            didChange.send(self)
        }
    }
    
    init() {
        self.name = "Chambéry"
        self.longitude = 5.915807
        self.latitude = 45.572353
        self.getWeather()
    }
    
    init(cityData data: CityValidation.CityData) {
        self.name = data.name
        self.longitude = data.geometry.location.longitude
        self.latitude = data.geometry.location.latitude
        self.getWeather()
    }
    
    private func getWeather() {
        WeatherManager.getWeather(for: self) { (weather) in
            DispatchQueue.main.async {
                self.weather = weather
            }
        }
    }
    
}
