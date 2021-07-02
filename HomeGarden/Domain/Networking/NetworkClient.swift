//
//  Created by Maciej Gorecki on 02/07/2021
//

import Foundation

struct NetworkClient {
    let session: URLSession
    let defaultHeaders: HTTPHeaders
    
    init(
        session: URLSession,
        defaultHeaders: HTTPHeaders = ["content-type": "application/json"]
    ) {
        self.session = session
        self.defaultHeaders = defaultHeaders
    }
    
    func execute<E: Endpoint>(_ endpoint: E) async throws -> E.Response {
        guard let url = URL(string: endpoint.url) else {
            throw NetworkError.invalidURL(url: endpoint.url)
        }
        
        var components = URLComponents(
            url: url,
            resolvingAgainstBaseURL: true
        )
        
        if !endpoint.query.isEmpty {
            components?.queryItems = endpoint.query
        }
        
        var request = URLRequest(
            url: components?.url ?? url
        )
        
        request.httpMethod = endpoint.method.rawValue
        
        request.allHTTPHeaderFields = defaultHeaders.merging(
            endpoint.headers, uniquingKeysWith: { $1 }
        )
        
        if let body = try endpoint.body() {
            request.httpBody = body
        }
                
        let (data, response) = try await session.data(for: request, delegate: nil)
                
        guard let httpResponse = (response as? HTTPURLResponse) else {
            throw NetworkError.unknown
        }
        
        guard 200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.invalid(response: httpResponse)
        }
        
        return try endpoint.decode(data: data)
    }
}
