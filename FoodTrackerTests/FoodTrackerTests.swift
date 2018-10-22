//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Thomas Phillips on 9/27/18.
//  Copyright © 2018 Thomas Phillips. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    // MARK: Meal Class Tests
    func testMealInitializationSucceeds() {
        // Zero star rating
        let zeroStarRatingMeal = Meal.init(name: "Zero", rating: 0, photo: nil)
        XCTAssertNotNil(zeroStarRatingMeal)
        
        // Five star rating
        let fiveStarRatingMeal = Meal.init(name: "Five", rating: 5, photo: nil)
        XCTAssertNotNil(fiveStarRatingMeal)
    }
    
    func testMealInitializationFails() {
        // Negative star rating
        let negativeStarRatingMeal = Meal.init(name: "Negative", rating: -1, photo: nil)
        XCTAssertNil(negativeStarRatingMeal)
        
        // Six star rating
        let sixStarRatingMeal = Meal.init(name: "Six", rating: 6, photo: nil)
        XCTAssertNil(sixStarRatingMeal)
        
        // Empty string for meal name
        let emptyStringMealName = Meal.init(name: "", rating: 3, photo: nil)
        XCTAssertNil(emptyStringMealName)
    }
}
