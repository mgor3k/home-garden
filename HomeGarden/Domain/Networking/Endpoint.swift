//
//  Created by Maciej Gorecki on 02/07/2021
//

import Foundation

protocol Endpoint {
    associatedtype Response
    
    var url: String { get }
    var method: HTTPMethod { get }
    var query: [URLQueryItem] { get }
    var headers: HTTPHeaders { get }
    
    func body() throws -> Data?
    func decode(data: Data) throws -> Response
}

extension Endpoint {
    var query: [URLQueryItem] {
        []
    }
    
    var headers: HTTPHeaders {
        [:]
    }
}

extension Endpoint where Response == Void {
    func decode(data: Data) throws -> Response {
        ()
    }
}

extension Endpoint where Response: Decodable {
    func decode(data: Data) throws -> Response {
        try JSONDecoder().decode(Response.self, from: data)
    }
}
