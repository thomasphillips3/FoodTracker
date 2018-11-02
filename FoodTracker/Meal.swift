//
//  Meal.swift
//  FoodTracker
//
//  Created by Thomas Phillips on 10/21/18.
//  Copyright © 2018 Thomas Phillips. All rights reserved.
//

import UIKit
import os.log

class Meal: NSObject, NSCoding {
    // MARK: - Properties
    var name: String
    var rating: Int
    var photo: UIImage?
    struct propertyKey {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }
    
    // MARK: - Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    // MARK: - Initialization
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
    
    // MARK: - NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: propertyKey.name)
        aCoder.encode(photo, forKey: propertyKey.photo)
        aCoder.encode(rating, forKey: propertyKey.rating)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: propertyKey.name) as? String else {
            os_log("Unable to decode meal's name", log: OSLog.default, type: .debug)
            return nil
        }
        
        let photo = aDecoder.decodeObject(forKey: propertyKey.photo) as? UIImage
        let rating = aDecoder.decodeInteger(forKey: propertyKey.rating)
        self.init(name: name, rating: rating, photo: photo)
    }
}
