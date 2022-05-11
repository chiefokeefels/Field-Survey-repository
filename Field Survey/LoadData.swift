//
//  LoadData.swift
//  Field Survey
//
//  Created by Tom OKeefe on 4/21/22.
//

import Foundation

enum classification: String, Codable {
    case amphibian
    case bird
    case fish
    case insect
    case mammal
    case plant
    case reptile
}

struct Observation: Codable, Identifiable {
    var id = UUID()
    var classification: classification
    var title: String
    var description: String
    var date: Date
    
    private enum CodingKeys: String, CodingKey {
        case classification, title, description, date
    }
}

struct Observations: Codable {
    var status: String
    var observations: [Observation]
}

class ObservationsLoader {
    
    class func loadObs(jsonFileName: String) -> Observations? {
        var theObservations: Observations?
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json"),
            let jsonData = try? Data(contentsOf: jsonFileUrl) {
                theObservations = try? jsonDecoder.decode(Observations.self, from: jsonData)
        }
        
        return theObservations
    }
}
