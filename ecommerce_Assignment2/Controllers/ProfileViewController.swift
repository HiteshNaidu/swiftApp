//
//  ProfileViewController.swift
//  ecommerce_Assignment2
//
//  Created by user174122 on 8/13/20.
//  Copyright © 2020 May Derbas. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var userProfile: UILabel!
    
    var userEmail:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userProfile.text = userEmail
    }
    
}
