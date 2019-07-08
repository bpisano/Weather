//
//  CityRow.swift
//  Weather
//
//  Created by Lunabee on 13/06/2019.
//  Copyright © 2019 Snopia. All rights reserved.
//

import SwiftUI

struct CityRow : View {
    
    @ObjectBinding var city: City
    
    var body: some View {
        NavigationLink(destination: CityWeatherView(city: city)) {
            HStack(alignment: .firstTextBaseline) {
                Text(city.name)
                    .lineLimit(nil)
                    .font(.title)
                Spacer()
                HStack {
                    city.weather?.current.icon.image
                        .foregroundColor(Color.gray)
                        .font(.title)
                    Text(city.weather?.current.temperature.formattedTemperature ?? "-ºC")
                        .color(.gray)
                        .font(.title)
                }
            }
                .padding([.trailing, .top, .bottom])
        }
    }
    
}

//#if DEBUG
//struct CityRow_Previews : PreviewProvider {
//    static var previews: some View {
//        CityRow()
//    }
//}
//#endif
