//
//  MealsInCategoryTableVC.swift
//  MealNetwork
//
//  Created by Инна Степанова on 06.02.2022.
//

import UIKit

class MealsInCategoryTableVC: UITableViewController {
    
//    private var mealsInCategory: MealsInCategory?
    var categories1: Categories?
    var categoryName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = categoryName
        NetworkManager.shared.fetchCategories(from: "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(categoryName ?? "0")") { categories in
            self.categories1 = categories
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = categories1?.categories.meals.count
        return self.categories?.categories.meals.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealsInCategory", for: indexPath)

        let mealInCategory = mealsInCategory?.meals[indexPath.row]
        cell.textLabel?.text = mealInCategory?.strMeal
        ImageManager.shared.fetchImage(from: mealInCategory?.strMealThumb) { image in
            cell.imageView?.image = image
        }
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let mealsVC = segue.destination as? MealViewController else {return}
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        mealsVC.mealId = mealsInCategory?.meals[indexPath.row].idMeal
    }

}
