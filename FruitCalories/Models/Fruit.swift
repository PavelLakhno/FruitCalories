//
//  Fruit.swift
//  FruitCalories
//
//  Created by Павел Лахно on 04.11.2022.
//

struct Fruit: Decodable {
    let genus: String
    let name: String
    let nutritions: Nutrition
    
    init(fruitData: [String: Any]) {
        genus = fruitData["genus"] as? String ?? ""
        name = fruitData["name"] as? String ?? ""
        nutritions = Nutrition(nutritionData: fruitData["nutritions"] as! [String : Any])
    }
    
    static func getFruits(from value: Any) -> [Fruit] {
        guard let fruitsData = value as? [[String: Any]] else { return [] }
        return fruitsData.map { Fruit(fruitData: $0) }
    }
}

struct Nutrition: Decodable {
    let carbohydrates: Double
    let protein: Double
    let fat: Double
    let calories: Double
    let sugar: Double
    
    init(nutritionData: [String: Any]) {
        carbohydrates = nutritionData["carbohydrates"] as? Double ?? 0
        protein = nutritionData["protein"] as? Double ?? 0
        fat = nutritionData["fat"] as? Double ?? 0
        calories = nutritionData["calories"] as? Double ?? 0
        sugar = nutritionData["sugar"] as? Double ?? 0
    }
    
}
