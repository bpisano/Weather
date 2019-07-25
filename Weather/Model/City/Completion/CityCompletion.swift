//
//  CityCompletion.swift
//  Weather
//
//  Created by Lunabee on 13/06/2019.
//  Copyright © 2019 Snopia. All rights reserved.
//

import SwiftUI
import Combine

class CityCompletion: NSObject, BindableObject {
    
    var willChange = PassthroughSubject<CityCompletion, Never>()
    
    var predictions: [CityCompletion.Prediction] = [] {
        didSet {
            willChange.send(self)
        }
    }
    
    private var completionManager: CityCompletionManager
    
    override init() {
        predictions = []
        completionManager = CityCompletionManager()
        super.init()
    }
    
    func search(_ search: String) {
        completionManager.getCompletion(for: search) { (predictions) in
            DispatchQueue.main.async {
                self.predictions = predictions
            }
        }
    }
    
}
