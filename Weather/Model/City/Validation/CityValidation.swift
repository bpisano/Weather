//
//  CityValidation.swift
//  Weather
//
//  Created by Lunabee on 21/06/2019.
//  Copyright © 2019 Snopia. All rights reserved.
//

import UIKit

class CityValidation: NSObject {
    
    class func validateCity(withID placeID: String, _ completion: @escaping (_ city: City?) -> Void) {
        guard let url = URL(string: NetworkManager.APIURL.cityData(for: placeID)) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(CityValidation.Result.self, from: data)
                completion(City(cityData: result.cityData))
            } catch {
                print(error.localizedDescription)
                completion(nil)
            }
        }.resume()
    }

}
