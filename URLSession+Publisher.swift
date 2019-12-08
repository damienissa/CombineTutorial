import Foundation
import Combine

extension URLSession {
    
    @discardableResult
    func dataTaskPublisher<Response: Decodable>(for request: URLRequest, type: Response.Type) -> AnyPublisher<Response, Error> {
        
       dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: Response.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
