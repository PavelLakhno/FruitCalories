//
//  StartViewController.swift
//  FruitCalories
//
//  Created by Павел Лахно on 04.11.2022.
//

import UIKit

class StartViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navigationVC = segue.destination as? UINavigationController {
            let fruitsVC = navigationVC.topViewController as? FruitsViewController
            fruitsVC?.fetchFruits()
        }
    }

}

