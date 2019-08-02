//
//  NewCityView.swift
//  Weather
//
//  Created by Lunabee on 13/06/2019.
//  Copyright © 2019 Snopia. All rights reserved.
//

import SwiftUI

struct NewCityView : View {
    
    @State private var search: String = ""
    @State private var isValidating: Bool = false
    @ObservedObject private var completer: CityCompletion = CityCompletion()
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var cityStore: CityStore
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField("Search City", text: $search) {
                        self.completer.search(self.search)
                    }
                }
                
                Section {
                    ForEach(completer.predictions) { prediction in
                        Button(action: {
                            self.addCity(from: prediction)
                            self.presentationMode.value.dismiss()
                        }) {
                            Text(prediction.description)
                                .foregroundColor(.primary)
                        }
                    }
                }
            }
                .disabled(isValidating)
                .navigationBarTitle(Text("Add City"))
                .navigationBarItems(leading: cancelButton)
                .listStyle(GroupedListStyle())
        }
    }
    
    private var cancelButton: some View {
        Button(action: {
            self.presentationMode.value.dismiss()
        }) {
            Text("Cancel")
        }
    }
    
    private func addCity(from prediction: CityCompletion.Prediction) {
        isValidating = true
        
        CityValidation.validateCity(withID: prediction.id) { (city) in
            if let city = city {
                DispatchQueue.main.async {
                    self.cityStore.cities.append(city)
                    self.presentationMode.value.dismiss()
                }
            }
            
            DispatchQueue.main.async {
                self.isValidating = false
            }
        }
    }
    
}

//#if DEBUG
//struct AddCityView_Previews : PreviewProvider {
//    static var previews: some View {
//        AddCityView()
//    }
//}
//#endif
