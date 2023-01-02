//
//  URLSession+Decodable.swift
//  Car Rental
//
//  Created by Clineu Iansen Junior on 19/09/19.
//  Copyright © 2019 Clineu Iansen Junior. All rights reserved.
//

import Foundation

extension URLSession {
    
    func decodableTask<T: Decodable>(with url: URL, completion: @escaping (Result<T, ServiceError>) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { (data, response, error) in
            if let error = error as NSError? {
                switch error.code {
                case NSURLErrorTimedOut:
                    completion(.failure(.timeout))
                case NSURLErrorNotConnectedToInternet:
                    completion(.failure(.noConnection))
                default:
                    completion(.failure(.apiError))
                }
                return
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode != 200 {
                    completion(.failure(.invalidResponse))
                    return
                }
            }
            
            if let data = data {
                do {
                    let object = try self.decodeObject(data: data) as T
                    completion(.success(object))
                } catch {
                    completion(.failure(.decodeError))
                }
                return
            }
        }
    }
    
    private func decodeObject<T: Decodable>(data: Data) throws -> T {
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(T.self, from: data)
        return decoded
    }
}
