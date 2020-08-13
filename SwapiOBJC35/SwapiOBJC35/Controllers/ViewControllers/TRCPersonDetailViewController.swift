//
//  TRCPersonDetailViewController.swift
//  SwapiOBJC35
//
//  Created by Todd Crandall on 8/13/20.
//  Copyright © 2020 Todd Crandall. All rights reserved.
//

import UIKit

class TRCPersonDetailViewController: UIViewController {
    
    //MARK: - Properties
    var person: TRCPerson? {
        didSet {
            updateViews()
        }
    }
    
    //MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateViews() {
        guard let details = person else {return}
        DispatchQueue.main.async {
            self.nameLabel.text = "Name: \(details.name)"
            self.birthYearLabel.text = "Birth Year: \(details.birthYear ?? "Birth Year: N/A")"
        }
    }
}
