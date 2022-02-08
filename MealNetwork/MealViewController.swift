//
//  MealViewController.swift
//  MealNetwork
//
//  Created by Инна Степанова on 07.02.2022.
//

import UIKit

class MealViewController: UIViewController {

    private var meal: Meal!
    var mealId: String?
    @IBOutlet var mealImage: UIImageView!
    @IBOutlet var mealDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetchMeal(from: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(mealId ?? "")") { meal in
            self.meal = meal
        }
    }
    
}
