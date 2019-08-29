//
//  userFile.swift
//  Parsing lab
//
//  Created by Kary Martinez on 8/29/19.
//  Copyright © 2019 Kary Martinez. All rights reserved.
//

import Foundation

struct UserMode: Codable {
    let results: [ResultsWrapper]
}

struct ResultsWrapper: Codable {
    let name: userNameWrapper
    let email:String
   
    
    static func getUser(from data: Data) throws -> [ResultsWrapper] {
        do {
            let results = try JSONDecoder().decode(UserMode.self, from: data)
            return results.results
        } catch {
            throw JSONError.decodingError(error)
        }
        
    }
}


struct userNameWrapper: Codable {
    let title: String
    let first: String
    let last: String
}


