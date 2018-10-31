//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by Thomas Phillips on 10/21/18.
//  Copyright © 2018 Thomas Phillips. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    // MARK: Properties
    var meals = [Meal]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleMeals()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MealTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MealTableViewCell else {
            fatalError("Dequeued cell is no an instance of MealTableViewCell")
        }
        
        let meal = meals[indexPath.row]
        
        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating

        return cell
    }
 
    // MARK: Actions
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? MealViewController, let meal = sourceViewController.meal {
            let newIndexPath = IndexPath(row: meals.count, section: 0)
            meals.append(meal)
            
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    // MARK: Private Methods
    
    private func loadSampleMeals() {
        let photo1 = UIImage(named: "meal1")
        let photo2 = UIImage(named: "meal2")
        let photo3 = UIImage(named: "meal3")
        
        guard let meal1 = Meal(name: "Salmon, rice, and vegetables", rating: 4, photo: photo1) else {
            fatalError("Unable to instantiate Meal 1")
        }
        
        guard let meal2 = Meal(name: "Chicken breast and zucchini", rating: 5, photo: photo2) else {
            fatalError("Uable to instantiate Meal 2")
        }
        
        guard let meal3 = Meal(name: "Green slime, eggs & avocado", rating: 3, photo: photo3) else {
            fatalError("Unable to instantiate Meal 3")
        }
        
        meals += [meal1, meal2, meal3]
    }
    
}
