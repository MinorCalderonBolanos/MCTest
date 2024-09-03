//
//  CharacterDetailView.swift
//  MCTest
//
//  Created by Jorge Minor Calderon B. on 2/9/24.
//

import SwiftUI

struct CharacterDetailView: View {
    @ObservedObject var viewModel: CharacterDetailViewModel
    
    var body: some View {
        ScrollView {
            if viewModel.isLoading {
                ProgressView()
            } else if let character = viewModel.character {
                VStack(alignment: .leading) {
                    AsyncImage(url: URL(string: character.image)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 300)
                    .clipped()
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .padding()
                    
                    Text(character.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    HStack {
                        Text("Status: \(character.status)")
                        Spacer()
                        Text("Species: \(character.species)")
                        Spacer()
                        Text("Gender: \(character.gender)")
                    }
                    .font(.subheadline)
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Origin")
                            .font(.headline)
                        Text(character.origin.name)
                            .font(.body)
                            .padding(.horizontal)
                        
                        Divider()
                        
                        Text("Current Location")
                            .font(.headline)
                        Text(character.location.name)
                            .font(.body)
                            .padding(.horizontal)
                    }
                    .padding(.horizontal)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Episodes")
                            .font(.headline)
                        ForEach(character.episode, id: \.episode) { episode in
                            Text(episode.name)
                                .font(.body)
                                .foregroundColor(.blue)
                                .padding(.horizontal)
                                .lineLimit(1)
                                .truncationMode(.middle)
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .navigationTitle(character.name)
            } else {
                Text("Character not found")
            }
        }
    }
}
