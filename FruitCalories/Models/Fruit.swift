//
//  Fruit.swift
//  FruitCalories
//
//  Created by Павел Лахно on 04.11.2022.
//

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
