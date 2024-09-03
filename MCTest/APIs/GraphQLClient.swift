import Foundation

class GraphQLClient {
    private let url: String

    init(url: String) {
        self.url = url
    }
    
    func fetchGraphQL<T: Decodable>(query: String, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let graphqlURL = URL(string: self.url) else {
            completion(.failure(.requestFailed))
            return
        }

        var request = URLRequest(url: graphqlURL)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"

        let requestBody = ["query": query]
        request.httpBody = try? JSONSerialization.data(withJSONObject: requestBody, options: [])

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.requestFailed))
                return
            }

            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(.decodingFailed))
            }
        }
        task.resume()
    }
}
