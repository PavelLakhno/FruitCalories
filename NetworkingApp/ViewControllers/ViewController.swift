//
//  ViewController.swift
//  NetworkingApp
//
//  Created by Павел Лахно on 04.11.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    private func fetchFruit() {
        guard let url = URL(string: "https://www.fruityvice.com/api/fruit/all") else {return}
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let decoder = JSONDecoder()
            do {
                
            }
        }
    }


}

