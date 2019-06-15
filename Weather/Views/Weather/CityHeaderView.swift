//
//  CityHeaderView.swift
//  Weather
//
//  Created by Lunabee on 12/06/2019.
//  Copyright © 2019 Snopia. All rights reserved.
//

import SwiftUI

struct CityHeaderView: View {
    
    @ObjectBinding var city: City
    
    var temperature: String {
        guard let temperature = city.weather?.current.temperature else {
            return "-ºC"
        }
        return temperature.formattedTemperature
    }
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            HStack(alignment: .center, spacing: 16) {
                city.weather?.current.icon.image
                    .font(.largeTitle)
                Text(temperature)
                    .font(.largeTitle)
            }
            Spacer()
        }
            .frame(height: 110)
    }
    
}

//#if DEBUG
//struct CityHeader_Previews : PreviewProvider {
//    static var previews: some View {
//        CityHeaderView()
//    }
//}
//#endif
