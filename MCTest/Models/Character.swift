//
//  Character.swift
//  MCTest
//
//  Created by Jorge Minor Calderon B. on 2/9/24.
//

struct Character: Decodable, Identifiable {
    let id: String
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Location
    let location: Location
    let image: String
    let episode: [Episode]
}

struct Location: Decodable {
    let name: String
}

struct Episode: Decodable {
    let episode: String
    let name: String
}
