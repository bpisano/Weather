//
//  Weather.swift
//  Weather
//
//  Created by Lunabee on 12/06/2019.
//  Copyright © 2019 Snopia. All rights reserved.
//

import Foundation

struct Weather: Codable {
    
    var current: HourlyWeather
    var hours: Weather.List<HourlyWeather>
    var week: Weather.List<DailyWeather>
    
    enum CodingKeys: String, CodingKey {
        
        case current = "currently"
        case hours = "hourly"
        case week = "daily"
        
    }
    
}
