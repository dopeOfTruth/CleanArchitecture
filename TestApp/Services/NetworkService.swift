//
//  NetworkService.swift
//  TestApp
//
//  Created by Михаил Красильник on 27.04.2021.
//

import Foundation

class NetworkService {
    
    static let shared = NetworkService()
    
    func performRequest(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {

        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let data = data {
                completion(.success(data))
            } else if let error = error {
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
}
