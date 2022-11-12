//
//  NetworkManager.swift
//  FruitCalories
//
//  Created by user on 09.11.2022.
//

import Foundation
import UIKit
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

enum Link: String {
    case fruitsURL = "https://www.fruityvice.com/api/fruit/all"
    case bananaURL = "https://www.fruityvice.com/api/fruit/banana"
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
            
    func fetchFruits(from url: String, completion: @escaping(Result<[Fruit], AFError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let fruits = Fruit.getFruits(from: value)
                    completion(.success(fruits))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
}
