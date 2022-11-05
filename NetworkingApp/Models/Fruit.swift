//
//  Fruit.swift
//  NetworkingApp
//
//  Created by Павел Лахно on 04.11.2022.
//

//struct Fruits: Decodable {
//    let fruits: [String : Fruit]?
//}

struct Fruit: Decodable {
    let genus: String?
    let name: String?
    let nutritions: Nutrition?
}

struct Nutrition: Decodable {
    let carbohydrates: Double?
    let protein: Double?
    let fat: Double?
    let calories: Double?
    let sugar: Double?
}
