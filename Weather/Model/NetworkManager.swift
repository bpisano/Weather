//
//  NetworkManager.swift
//  Weather
//
//  Created by Lunabee on 21/06/2019.
//  Copyright © 2019 Snopia. All rights reserved.
//

import UIKit

class NetworkManager: NSObject {
    
    struct Key {
        
        static let darkSky: String = "" // Enter your darkSky API key here
        static let googleMaps: String = "" // Enter your google maps API key here
        static let flickr: String = "" // Enter your flickr API key here
        
    }
    
    struct APIURL {
        
        static func weatherRequest(longitude: Double, latitude: Double) -> String {
            return "https://api.darksky.net/forecast/\(NetworkManager.Key.darkSky)/\(latitude),\(longitude)?units=ca&lang=fr".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        }
        
        static func cityCompletion(for search: String) -> String {
            return "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=\(search)&types=(cities)&key=\(NetworkManager.Key.googleMaps)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        }
        
        static func cityData(for placeID: String) ->  String {
            return "https://maps.googleapis.com/maps/api/place/details/json?placeid=\(placeID)&key=\(NetworkManager.Key.googleMaps)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        }
        
        static func cityImage(for cityName: String) -> String {
            return "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(NetworkManager.Key.flickr)&tags=city&tag_mode=all&text=\(cityName)&sort=relevance&privacy_filter=1&content_type=1&geo_context=2&extras=url_l,owner_name&per_page=5&page=1&format=json&nojsoncallback=1".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        }
        
    }
        
}
