//
//  Meal.swift
//  MealNetwork
//
//  Created by Инна Степанова on 04.02.2022.
//

//struct MealDescription: Decodable {
//    let idMeal: String
//    let strMeal: String
//    let strArea: String
//    let strInstructions: String
//    let strMealThumb: String
//}
//
//struct Meal: Decodable {
//    let meal: [MealDescription]
//}
//
//struct MealInCategory: Decodable {
//    let strMeal: String
//    let strMealThumb: String
//    let idMeal: String
//}
//
//struct MealsInCategory: Decodable {
//    let meals: [MealInCategory]
//}
//
//struct Category: Decodable {
//    let idCategory: String
//    let strCategory: String
//    let strCategoryThumb: String
//    let strCategoryDescription: String
//}
//
//struct Categories: Decodable {
//    let categories: [Category]
//}


struct MealDescription: Decodable {
    let idMeal: String?
    let strMeal: String?
    let strArea: String?
    let strInstructions: String?
    let strMealThumb: String?
}

struct Meal: Decodable {
    let meal: [MealDescription]
}

struct Category: Decodable {
    let idCategory: String?
    let strCategory: String?
    let strCategoryThumb: String?
    let strCategoryDescription: String?
    let meals: [Meal]
}

struct Categories: Decodable {
    let categories: [Category]
}



