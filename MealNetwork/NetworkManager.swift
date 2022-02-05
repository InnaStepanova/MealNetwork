//
//  NetworkManager.swift
//  MealNetwork
//
//  Created by Инна Степанова on 04.02.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchCategories(from urlString: String, with complition: @escaping (Categories) -> Void) {
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { data, responce, error in
            if let error = error {
                print(error)
                return
            }
            
            if let responce = responce {
                print(responce)
            }
            guard let data = data else {return}
            do {
                let categories = try JSONDecoder().decode(Categories.self, from: data)
                DispatchQueue.main.async {
                    complition(categories)
                }
            } catch let jsonError {
                print(jsonError)
            }
        }.resume()
    }
    
    func fetchMealsInCategory(from urlString: String, with complition: @escaping (MealsInCategory) -> Void) {
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { data, responce, error in
            
            if let error = error {
                print(error)
                return
            }
            
            if let responce = responce {
                print(responce)
            }
            guard let data = data else {return}
            do {
                let category = try JSONDecoder().decode(MealsInCategory.self, from: data)
                DispatchQueue.main.async {
                    complition(category)
                }
            } catch let jsonError {
                print(jsonError)
            }
        }.resume()
    }
    
    func fetchMeal(from urlString: String, with complition: @escaping (Meal) -> Void) {
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { data, responce, error in
            
            if let error = error {
                print(error)
                return
            }
            
            if let responce = responce {
                print(responce)
            }
            guard let data = data else {return}
            do {
                let category = try JSONDecoder().decode(Meal.self, from: data)
                DispatchQueue.main.async {
                    complition(category)
                }
            } catch let jsonError {
                print(jsonError)
            }
        }.resume()
    }
    
}

class ImageManager {
    
    static let shared = ImageManager()
    
    private init() {}

    func fetchImage(from url: String?) -> Data? {
        guard let stringURL = url else {return nil}
        guard let imageURL = URL(string: stringURL) else {return nil} // Поставить заглушку в случае неудачи
        return try? Data(contentsOf: imageURL)
    }
}

