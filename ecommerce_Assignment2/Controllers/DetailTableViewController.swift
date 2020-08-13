//
//  DetailTableViewController.swift
//  ecommerce_Assignment2
//
//  Created by May Derbas on 2020-07-16.
//  Copyright © 2020 May Derbas. All rights reserved.
//

import UIKit
//this is a detail pages
class DetailTableViewController: UITableViewController {
        
    @IBOutlet weak var productDetailLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    var product: Product?
    
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder:aDecoder)
//        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(DetailTableViewController.tap(_:)));
//        productImageView.isUserInteractionEnabled = true
//        productImageView.addGestureRecognizer(tapRecognizer)
//
//
//    }
        override func viewDidLoad() {
            title = "Product Detail"
            
            
            // set product to our imageview and labels,
            
            
            productImageView.image = product!.image
            productTitleLabel.text = product!.name
            productPriceLabel.text = " $ \(product!.price) "
            productDetailLabel.text = product!.details
            
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(DetailTableViewController.tap(_:)));
                   productImageView.isUserInteractionEnabled = true
                   productImageView.addGestureRecognizer(tapRecognizer)
            
            //tapGesture = UITapGestureRecognizer(target: self, action: #selector(DetailTableViewController.doubleTap(_:)));
        }
        
    // logout and go back to first view
        
    @IBAction func logoutButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    // when the cell is selcted, it will not be highlighted
        override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
                return nil                                // we prevent any selection in detail page
            }
    

    @objc func tap(_ gestureRecognizer: UITapGestureRecognizer) {
        print("In single tap")
        let point = gestureRecognizer.location(in: productImageView)
        let menu = UIMenuController.shared
            let logout = UIMenuItem(title: "Logout",action: #selector(DetailTableViewController.logout))
            menu.menuItems = [logout]
            menu.showMenu(from:productImageView, rect: <#T##CGRect#>)
        
    }

    
    @objc func logout()
    {
        dismiss(animated: true, completion: nil)
    }



}

