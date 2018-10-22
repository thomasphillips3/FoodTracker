//
//  Meal.swift
//  FoodTracker
//
//  Created by Thomas Phillips on 10/21/18.
//  Copyright © 2018 Thomas Phillips. All rights reserved.
//

import UIKit

class Meal {
    // MARK: Properties
    var name: String
    var rating: Int
    var photo: UIImage?
    
    // MARK: Initialization
    init?(name: String, rating: Int, photo: UIImage?) {
        guard !name.isEmpty else {
            return nil
        }
        
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        self.name = name
        self.rating = rating
        self.photo = photo
    }
}
