//
//  NewCityView.swift
//  Weather
//
//  Created by Lunabee on 13/06/2019.
//  Copyright © 2019 Snopia. All rights reserved.
//

import SwiftUI

struct NewCityView : View {
    
    @Binding var isAddingCity: Bool
    
    @State private var search: String = ""
    
    @ObjectBinding var completer: CityCompletion = CityCompletion()
    @EnvironmentObject var cityStore: CityStore
    @Environment(\.isPresented) var isPresented: Binding<Bool>?
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    TextField($search, placeholder: Text("Search City")) {
                        self.completer.search(self.search)
                    }
                }
                
                Section {
                    ForEach(completer.predictions) { prediction in
                        Button(action: {
                            self.addCity(from: prediction)
                            self.isAddingCity = false
                            self.isPresented?.value = false
                        }) {
                            Text(prediction.description)
                                .foregroundColor(.primary)
                        }
                    }
                }
            }
                .navigationBarTitle(Text("Add City"))
                .navigationBarItems(leading: cancelButton)
                .listStyle(.grouped)
        }
    }
    
    private var cancelButton: some View {
        Button(action: {
            self.isAddingCity = false
        }) {
            Text("Cancel")
        }
    }
    
    private func addCity(from prediction: CityCompletion.Prediction) {
        CityValidation.validateCity(withID: prediction.id) { (city) in
            if let city = city {
                DispatchQueue.main.async {
                    self.cityStore.cities.append(city)
                    self.isAddingCity = false
                }
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
