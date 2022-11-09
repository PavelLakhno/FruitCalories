//
//  InfoFruitViewController.swift
//  FruitCalories
//
//  Created by Павел Лахно on 08.11.2022.
//

import UIKit

final class InfoFruitViewController: UIViewController {

    @IBOutlet weak var fruitNameLabel: UILabel!
    @IBOutlet weak var genusLabel: UILabel!
    @IBOutlet weak var sugarLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var fatLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var carbohydratesLabel: UILabel!
    
    @IBOutlet weak var fruitImage: UIImageView! {
        didSet {
            fruitImage.layer.cornerRadius = fruitImage.frame.size.width / 2
        }
    }
    
    var fruit: Fruit!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitImage.image = UIImage(named: fruit.name ?? "")
        fruitNameLabel.text = fruit.name
        genusLabel.text = "genus: \(fruit.genus ?? "")"
        sugarLabel.text = String(format: "%.2f", (fruit.nutritions?.sugar ?? 0))
        caloriesLabel.text = "\(fruit.nutritions?.calories ?? 0)"
        fatLabel.text = "\(fruit.nutritions?.fat ?? 0)"
        proteinLabel.text = "\(fruit.nutritions?.protein ?? 0)"
        carbohydratesLabel.text = "\(fruit.nutritions?.carbohydrates ?? 0)"
    }

}
