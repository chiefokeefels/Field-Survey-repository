//
//  ObsView.swift
//  Field Survey
//
//  Created by Tom OKeefe on 4/21/22.
//

import SwiftUI

struct ObsView: View {
    let theDateFormatter = DateFormatter()
    var classification: classification
    var title: String
    var description: String
    var date: Date
    init(classification: classification, title:String, description:String, date:Date){
        theDateFormatter.dateFormat = "YYYY-MM-DDTHH:MM:SSZ"
        self.classification = classification
        self.title = title
        self.description = description
        self.date = date
    }
    var body: some View {
        VStack {
            Text("Observation")
                .font(.title)
            HStack{
                Image(self.classification.rawValue)
                VStack{
                    Text(self.title)
                    Text(theDateFormatter.string(from: self.date)).font(.system(size: 14.0))
                }
            }
            Text(self.description)
        }
    }
}

/*
struct ObsView_Previews: PreviewProvider {
    static var previews: some View {
        ObsView()
    }
}
*/
