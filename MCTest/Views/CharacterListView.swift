//
//  CharacterListView.swift
//  MCTest
//
//  Created by Jorge Minor Calderon B. on 2/9/24.
//

import SwiftUI

struct CharacterListView: View {
    @ObservedObject var viewModel: CharacterListViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.characters) { character in
                    NavigationLink(
                        destination: CharacterDetailView(
                            viewModel: CharacterDetailViewModel(
                                characterID: character.id,
                                client: DependencyInjector.shared.provideGraphQLClient()
                            )
                        )
                    ) {
                        HStack {
                            AsyncImage(url: URL(string: character.image)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())

                            VStack(alignment: .leading) {
                                Text(character.name).font(.headline)
                                Text(character.species).font(.subheadline)
                            }
                        }
                    }
                }
                if viewModel.hasNextPage {
                    ProgressView().onAppear {
                        viewModel.loadMoreCharacters()
                    }
                }
            }
            .navigationTitle("Characters")
        }
    }
}
