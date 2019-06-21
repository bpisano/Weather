//
//  CityStore.swift
//  Weather
//
//  Created by Benjamin Pisano on 15/06/2019.
//  Copyright © 2019 Snopia. All rights reserved.
//

import SwiftUI
import Combine

class CityStore: BindableObject {
    
    let didChange = PassthroughSubject<CityStore, Never>()
    
    var cities: [City] = [City()] {
        didSet {
            didChange.send(self)
        }
    }
    
}
