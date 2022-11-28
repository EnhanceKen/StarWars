//
//  PageResults.swift
//  StarWarsExam
//
//  Created by Consultant on 11/23/22.
//

import Foundation


struct PageResult : Decodable {
    let count : Int
    let next : URL?
    let previous : URL?
    let results : [Person]
}
 
struct Person : Decodable {
    let name : String
    let hairColor : String
    let eyeColor : String
    let homeworld : URL
    let films : URL?
    
    enum CodingKeys: String, CodingKey {
        case hairColor = "hair_color"
        case eyeColor = "eye_color"
        case name, homeworld, films
    }
    
struct Planets: Decodable {
    let planet : String
    }

    
}
