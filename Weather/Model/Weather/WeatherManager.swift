//
//  WeatherManager.swift
//  Weather
//
//  Created by Lunabee on 12/06/2019.
//  Copyright © 2019 Snopia. All rights reserved.
//

import Foundation

class WeatherManager {
    
    static func getWeather(for city: City, _ completion: @escaping (_ weather: Weather?) -> Void) {
        guard let url = URL(string: NetworkManager.APIURL.weatherRequest(longitude: city.longitude, latitude: city.latitude)) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .secondsSince1970
                
                let weatherObject = try decoder.decode(Weather.self, from: data)
                completion(weatherObject)
            } catch {
                print(error.localizedDescription)
                completion(nil)
            }
        }.resume()
    }
    
}
