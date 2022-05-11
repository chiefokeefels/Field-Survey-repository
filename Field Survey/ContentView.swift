//
//  ContentView.swift
//  Field Survey
//
//  Created by Tom OKeefe on 4/21/22.
//

import SwiftUI

struct ContentView: View {
    var theObservations: Observations?
    let jsonFileName = "field_observations"
    let theDateFormatter = DateFormatter()
    
    init() {
        theDateFormatter.dateFormat = "YYYY-MM-DDTHH:MM:SSZ"
        self.theObservations = ObservationsLoader.loadObs(jsonFileName: jsonFileName)
    }
    var body: some View {
        NavigationView{
            List(theObservations!.observations){ theObs in
            
                NavigationLink(destination:ObsView(classification: theObs.classification, title:theObs.title, description:theObs.description, date:theObs.date)){
                    
                    HStack {
                        Image(theObs.classification.rawValue)
                        VStack {
                            Text(theObs.title).navigationTitle("Field Survey")

                            Text(theDateFormatter.string(from: theObs.date)).font(.system(size: 14.0))
                        }
                    }
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
