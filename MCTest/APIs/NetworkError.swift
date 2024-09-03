//
//  NetworkError.swift
//  MCTest
//
//  Created by Jorge Minor Calderon B. on 2/9/24.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case requestFailed
    case decodingFailed
    case unknown

    var errorDescription: String? {
        switch self {
        case .requestFailed:
            return "Request failed."
        case .decodingFailed:
            return "Decoding the response failed."
        case .unknown:
            return "An unknown error occurred."
        }
    }
}
