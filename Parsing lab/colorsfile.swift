//
//  colorsfile.swift
//  Parsing lab
//
//  Created by Kary Martinez on 8/27/19.
//  Copyright © 2019 Kary Martinez. All rights reserved.
//

import Foundation

enum JSONError: Error {
    case decodingError(Error)
}


struct colorsOutput: Codable {
    let mode: String
    let count: Int
    let colors: String
    static func getcolors(from data: Data) throws -> [colorsOutput] {
        do {
            let colors = try JSONDecoder().decode([colorsOutput].self, from: data)
            return colors
        } catch {
            throw JSONError.decodingError(error)
        }
      
    }
    
}
