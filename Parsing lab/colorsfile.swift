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


struct colorsModel: Codable {
    let colors: [colorWrapper]
}

struct colorWrapper: Codable {
    let hex: hexWrapper
    let rgb: rgbWrapper
    let name: nameWrapper
    
    static func getcolors(from data: Data) throws -> [colorWrapper] {
        do {
            let colors = try JSONDecoder().decode(colorsModel.self, from: data)
            return colors.colors
        } catch {
            throw JSONError.decodingError(error)
        }
        
    }
}

struct hexWrapper: Codable {
    let value: String
}

struct rgbWrapper: Codable {
    let fraction: fractionUnwrapper    
}

struct fractionUnwrapper: Codable {
    let r: Double
    let g: Double
    let b: Double
}

struct nameWrapper: Codable {
    let value: String
}

