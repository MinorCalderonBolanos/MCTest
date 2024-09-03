//
//  CharacterDetailViewModel.swift
//  MCTest
//
//  Created by Jorge Minor Calderon B. on 2/9/24.
//

import SwiftUI

class CharacterDetailViewModel: ObservableObject {
    @Published var character: Character?
    @Published var isLoading: Bool = false

    private var client: GraphQLClient

    init(characterID: String, client: GraphQLClient) {
        self.client = client
        fetchCharacterDetails(id: characterID)
    }

    func fetchCharacterDetails(id: String) {
        isLoading = true

        let query = GraphQLQueries.characterById(id)

        client.fetchGraphQL(query: query) { (result: Result<GraphQLResponse<CharacterData>, NetworkError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let graphQLResponse):
                    self.character = graphQLResponse.data.character
                case .failure(let error):
                    print("Error loading character: \(error.localizedDescription)")
                }
                self.isLoading = false
            }
        }
    }
}

struct CharacterData: Decodable {
    let character: Character
}
