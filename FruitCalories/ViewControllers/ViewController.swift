//
//  ViewController.swift
//  FruitCalories
//
//  Created by Павел Лахно on 04.11.2022.
//

import UIKit

enum Link: String {
    case fruitsURL = "https://www.fruityvice.com/api/fruit/all"
    case bananaURL = "https://www.fruityvice.com/api/fruit/banana"
}

enum Alert {
    case success
    case failed
    
    var title: String {
        switch self {
        case .success:
            return "Success"
        case .failed:
            return "Failed"
        }
    }
    
    var message: String {
        switch self {
        case .success:
            return "You can see the result in the Debug area"
        case .failed:
            return "You can see error in the Debug area"
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFruit()
    }
    
    // MARK: Private Methods
    private func fetchFruit() {
        guard let url = URL(string: Link.fruitsURL.rawValue) else {return}
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let fruits = try decoder.decode([Fruit].self, from: data)
                print(fruits)
                self?.showAlert(withStatus: .success)
            } catch let error {
                self?.showAlert(withStatus: .failed)
                print(error.localizedDescription)
            }
        }.resume()
    }

    private func showAlert(withStatus status: Alert) {
        DispatchQueue.main.async { [unowned self] in
            let alert = UIAlertController(
                title: status.title,
                message: status.message,
                preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
        }
    }
}

