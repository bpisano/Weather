//
//  DoubleExtension.swift
//  Weather
//
//  Created by Lunabee on 13/06/2019.
//  Copyright © 2019 Snopia. All rights reserved.
//

import Foundation

extension Double {
    
    var formattedTemperature: String {
        let formatter = NumberFormatter()
        formatter.allowsFloats = false
        
        let formattedDouble = formatter.string(from: NSNumber(value: self)) ?? "-"
        return formattedDouble + "ºC"
    }
    
}
