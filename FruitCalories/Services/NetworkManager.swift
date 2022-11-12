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
            
//    func fetch<T: Decodable>(_ type: T.Type, from url: String?, completion: @escaping (Result<T, NetworkError>) -> Void) {
//        
//        guard let url = URL(string: url ?? "") else {
//            completion(.failure(.invalidURL))
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data else {
//                completion(.failure(.noData))
//                print(error?.localizedDescription ?? "No error description")
//                return
//            }
//            
//            do {
//                let type = try JSONDecoder().decode(T.self, from: data)
//                DispatchQueue.main.async {
//                    completion(.success(type))
//                }
//            } catch let error {
//                print(error.localizedDescription)
//            }
//        }.resume()
        
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
