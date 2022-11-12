//
//  FruitsViewController.swift
//  FruitCalories
//
//  Created by Павел Лахно on 08.11.2022.
//

import UIKit

class FruitsViewController: UITableViewController {
    
    private var fruits: [Fruit] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showSpinner(in: tableView)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let infoFruitVC = segue.destination as? InfoFruitViewController
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        infoFruitVC?.fruit = fruits[indexPath.row]
    }

    // MARK: - TableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = fruits[indexPath.row].name
        content.image = UIImage(named: fruits[indexPath.row].name ?? "")
        content.imageProperties.maximumSize = CGSize(width: 40.0, height: 40.0)
        cell.contentConfiguration = content
        return cell
    }
    
    // MARK: Private Methods
    private func failedAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Failed",
                message: "You can see error in the Debug area",
                preferredStyle: .alert
            )

            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
    private func showSpinner(in view: UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .gray
        activityIndicator.startAnimating()
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true

        view.addSubview(activityIndicator)

        return activityIndicator
    }
}

// MARK: - Networking
extension FruitsViewController {

//    func fetchFruits() {
//        NetworkManager.shared.fetch([Fruit].self, from: Link.fruitsURL.rawValue) { [weak self] result in
//            switch result {
//            case .success(let fruits):
//                self?.fruits = fruits
//                self?.tableView.reloadData()
//            case .failure(let error):
//                print(error.localizedDescription)
//                self?.failedAlert()
//            }
//        }
//    }
    
    func fetchFruits() {
        NetworkManager.shared.fetchFruits(from: Link.fruitsURL.rawValue) { [weak self]
            result in
            switch result {
            case .success(let fruits):
                self?.fruits = fruits
                self?.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
