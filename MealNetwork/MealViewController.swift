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
        title = mealId

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
