//
//  weatherFile.swift
//  Parsing lab
//
//  Created by Kary Martinez on 8/28/19.
//  Copyright © 2019 Kary Martinez. All rights reserved.
//

import Foundation

struct weatherMode: Codable {
    let list: [listWrapper]
}

struct listWrapper: Codable {
    let name: String
    let main: mainWrapper
    let weather: [weatherWrapper]
    
    static func getWeather(from data: Data) throws -> [listWrapper] {
        do {
            let list = try JSONDecoder().decode(weatherMode.self, from: data)
            return list.list
        } catch {
            throw JSONError.decodingError(error)
        }
        
    }
}


struct mainWrapper: Codable {
    let temp: Double
}

struct weatherWrapper: Codable {
    let main:String
}
