//
//  CategoriesTableVC.swift
//  MealNetwork
//
//  Created by Инна Степанова on 04.02.2022.
//

import UIKit

class CategoriesTableVC: UITableViewController {
    let cateriesStringURL = "https://www.themealdb.com/api/json/v1/1/categories.php"
    var categories: Categories?

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetchCategories(from: cateriesStringURL) { categories in
            self.categories = categories
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories?.categories.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categories", for: indexPath)
        let category = categories?.categories[indexPath.row]
        cell.textLabel?.text = category?.strCategory
        ImageManager.shared.fetchImage(from: category?.strCategoryThumb) { image in
            cell.imageView?.image = image
        }
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let mealsInCategoryVC = segue.destination as? MealsInCategoryTableVC else {return}
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        mealsInCategoryVC.categoryName = categories?.categories[indexPath.row].strCategory
    }
}

