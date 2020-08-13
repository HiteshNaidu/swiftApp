//
//  ViewFullImage.swift
//  ecommerce_Assignment2
//
//  Created by user173205 on 8/13/20.
//  Copyright © 2020 May Derbas. All rights reserved.
//

import UIKit

class ViewFullImage: UIViewController {
    
    var myImage: UIImage!
    @IBOutlet weak var productImage: UIImageView!
    override func viewDidLoad() {
        productImage.image = myImage;

}

}
