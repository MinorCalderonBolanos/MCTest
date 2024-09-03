//
//  CharacterListViewModel.swift
//  MCTest
//
//  Created by Jorge Minor Calderon B. on 2/9/24.
//

import Combine
import SwiftUI

class CharacterListViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isLoading: Bool = false

    private var client: GraphQLClient
    private var cancellables: Set<AnyCancellable> = []
    
    private var currentPage = 1
    var hasNextPage = false

    init(client: GraphQLClient) {
        self.client = client
        fetchCharacters()
    }

    func fetchCharacters() {
        guard !isLoading else { return }
        isLoading = true

        let query = GraphQLQueries.allCharacters(page: self.currentPage)

        client.fetchGraphQL(query: query) { (result: Result<GraphQLResponse<CharactersData>, NetworkError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let graphQLResponse):
                    let characterResponse = graphQLResponse.data.characters
                    self.characters.append(contentsOf: characterResponse.results)
                    self.hasNextPage = characterResponse.info.next != nil
                    if self.hasNextPage {
                        self.currentPage += 1
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
                self.isLoading = false
            }
        }
    }

    func loadMoreCharacters() {
        fetchCharacters()
    }
}
