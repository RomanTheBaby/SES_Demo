//
//  NetworkService.swift
//  ShopyFlopy
//
//  Created by Roman on 2024-06-05.
//

import Foundation

class NetworkService {
    
    func makeRequest(_ urlRequest: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        // TODO: Adding this is a task
        URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            completion(data, error)
        }
    }
    
}
