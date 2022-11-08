//
//  FruitsViewController.swift
//  FruitCalories
//
//  Created by Павел Лахно on 08.11.2022.
//

import UIKit

class FruitsViewController: UITableViewController {
    
    var fruits: [Fruit]!

    override func viewDidLoad() {
        super.viewDidLoad()
        print(fruits.count)
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
        cell.contentConfiguration = content
        return cell
    }
    
}
