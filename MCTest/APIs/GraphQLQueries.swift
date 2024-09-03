//
//  GraphQLQueries.swift
//  MCTest
//
//  Created by Jorge Minor Calderon B. on 2/9/24.
//

import Foundation

struct GraphQLQueries {
    static func characterById(_ id: String) -> String {
        return """
        {
          character(id: \(id)) {
            id
            name
            status
            species
            type
            gender
            origin {
              name
            }
            location {
              name
            }
            image
            episode {
              episode
              name
            }
          }
        }
        """
    }

    static func allCharacters(page: Int) -> String {
        return """
        {
          characters(page: \(page)) {
            info {
              count
              pages
              next
              prev
            }
            results {
              id
              name
              status
              species
              type
              gender
              origin {
                name
              }
              location {
                name
              }
              image
              episode {
                episode
                name
              }
            }
          }
        }
        """
    }
}
