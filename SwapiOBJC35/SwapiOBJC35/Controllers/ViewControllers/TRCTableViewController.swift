//
//  TRCTableViewController.swift
//  SwapiOBJC35
//
//  Created by Todd Crandall on 8/13/20.
//  Copyright © 2020 Todd Crandall. All rights reserved.
//

import UIKit

class TRCTableViewController: UITableViewController {
    
    //MARK: - Properties
    var name: String?
    var birthYear: String?
    var people: [String] = [] {
        didSet {
//            updateViews()
        }
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        guard let name = name,
//            let birthYear = birthYear else { return }
        TRCPersonController.sharedInstance().fetchPeople { (success) in
            if success {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                print("Lights are on...but no one's home.")
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TRCPersonController.sharedInstance().people.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        
        let person = TRCPersonController.sharedInstance().people[indexPath.row]
        cell.textLabel?.text = person.name
        return cell
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPersonDetailsVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let destinationVC = segue.destination as? TRCPersonDetailViewController
                else { return }
            
            let selectedPerson = TRCPersonController.sharedInstance().people[indexPath.row]
            destinationVC.person = selectedPerson
        }
    }
    
//    //MARK: - Method
//    func updateViews() {
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
//    }
}//End of Class
