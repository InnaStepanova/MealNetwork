//
//  MealsInCategoryTableVC.swift
//  MealNetwork
//
//  Created by Инна Степанова on 06.02.2022.
//

import UIKit

class MealsInCategoryTableVC: UITableViewController {
    
    private var mealsInCategory: MealsInCategory?
    var categoryName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = categoryName
        NetworkManager.shared.fetchMealsInCategory(from: "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(categoryName ?? "0")") { meals in
            self.mealsInCategory = meals
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mealsInCategory?.meals.count ?? 0
        
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
