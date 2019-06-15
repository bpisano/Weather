//
//  CityFinder.swift
//  Weather
//
//  Created by Lunabee on 13/06/2019.
//  Copyright © 2019 Snopia. All rights reserved.
//

import SwiftUI
import Combine
import MapKit

class CityFinder: NSObject, BindableObject {
    
    struct Result {
        
        var name: String
        var longitude: Double
        var latitude: Double
        
    }
    
    var didChange = PassthroughSubject<CityFinder, Never>()
    
    var results: [String] = [] {
        didSet {
            didChange.send(self)
        }
    }
    
    private var searcher: MKLocalSearchCompleter
    
    override init() {
        results = []
        searcher = MKLocalSearchCompleter()
        super.init()
        searcher.resultTypes = .address
        searcher.delegate = self
    }
    
    func search(_ text: String) {
        searcher.queryFragment = text
    }
    
}

extension CityFinder: MKLocalSearchCompleterDelegate {
    
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        results = completer.results.map({ $0.title })
    }
    
}
