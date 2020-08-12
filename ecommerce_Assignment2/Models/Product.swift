//
//  Product.swift
//  ecommerce_Assignment2
//
//  Created by May Derbas on 2020-07-16.
//  Copyright © 2020 May Derbas. All rights reserved.
//

import Foundation
import UIKit

class Product
{
    var name: String
    var image: UIImage
    var details: String
    var price: Double
    
    init(name: String, details: String, price: Double, imageName: String)
    {
        self.name = name
        self.details = details
        self.price = price
        if let image = UIImage(named: imageName){
            self.image = image
        }else {
            self.image = UIImage(named: "handbag1")!
        }
    }
    
}
