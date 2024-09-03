//
//  DependencyInjector.swift
//  MCTest
//
//  Created by Jorge Minor Calderon B. on 2/9/24.
//

class DependencyInjector {
    static let shared = DependencyInjector()
    private init() {}

    func provideGraphQLClient() -> GraphQLClient {
        let url = "https://rickandmortyapi.com/graphql"
        return GraphQLClient(url: url)
    }

    func provideCharacterListViewModel() -> CharacterListViewModel {
        return CharacterListViewModel(client: provideGraphQLClient())
    }
}
