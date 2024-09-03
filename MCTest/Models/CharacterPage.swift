//
//  CharacterPage.swift
//  MCTest
//
//  Created by Jorge Minor Calderon B. on 2/9/24.
//

struct CharacterResponse: Decodable {
    let info: PageInfo
    let results: [Character]
}

struct PageInfo: Decodable {
    let count: Int
    let pages: Int
    let next: Int?
    let prev: Int?
}


struct GraphQLResponse<T: Decodable>: Decodable {
    let data: T
}

struct CharactersData: Decodable {
    let characters: CharacterResponse
}
