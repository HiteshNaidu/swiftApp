//
//  ProductTableViewCell.swift
//  ecommerce_Assignment2
//
//  Created by May Derbas on 2020-07-16.
//  Copyright © 2020 May Derbas. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

     
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productDetailsLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
       var product: Product?{
       didSet {
           self.updateUI()
           
           }
           
       }
       func updateUI()
       {
           productImageView?.image = product!.image
           productNameLabel?.text = product!.name
           productPriceLabel?.text = " $ \(product!.price) "
           productDetailsLabel?.text = product!.details
       }

}
