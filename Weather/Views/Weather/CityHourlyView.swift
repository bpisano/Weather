//
//  CityHourlyView.swift
//  Weather
//
//  Created by Lunabee on 13/06/2019.
//  Copyright © 2019 Snopia. All rights reserved.
//

import SwiftUI

struct CityHourlyView : View {
    
    @ObjectBinding var city: City
    
    private let rowHeight: CGFloat = 110
    
    var body: some View {
        ScrollView(alwaysBounceHorizontal: true, showsHorizontalIndicator: false) {
            HStack(spacing: 16) {
                ForEach(city.weather?.hours.list ?? []) { hour in
                    VStack(spacing: 16) {
                        Text(hour.time.formattedHour)
                            .font(.footnote)
                        hour.icon.image
                            .font(.body)
                        Text(hour.temperature.formattedTemperature)
                            .font(.headline)
                    }
                }
            }
                .frame(height: rowHeight)
                .padding(.trailing)
        }
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .frame(height: rowHeight)
    }
    
}

//#if DEBUG
//struct CityHourlyView_Previews : PreviewProvider {
//    static var previews: some View {
//        CityHourlyView()
//    }
//}
//#endif
