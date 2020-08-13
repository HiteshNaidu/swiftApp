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
            productImageView.isUserInteractionEnabled = true;
           // self.tableView.bringSubviewToFront(productImageView)
    
            
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(DetailTableViewController.tap(_:)));
                   //productImageView.isUserInteractionEnabled = true
                   productImageView.addGestureRecognizer(tapRecognizer)
            
            //tapGesture = UITapGestureRecognizer(target: self, action: #selector(DetailTableViewController.doubleTap(_:)));
        }
   /* override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        productImageView .becomeFirstResponder()
    }*/
    
        
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
        var point = gestureRecognizer.location(in: productImageView)
        print(point.x)
        let menu = UIMenuController.shared
        tableView.bringSubviewToFront(productImageView)
        let check = productImageView.becomeFirstResponder()
        print(check)
        let logout = UIMenuItem(title: "Logout",action: #selector(DetailTableViewController.logout))
        menu.menuItems = [logout]
        let rectObj:CGRect = CGRect(x:point.x, y:point.y ,width: 10,height: 7);
        print(rectObj)
        menu.showMenu(from:productImageView, rect: rectObj)
        productImageView.setNeedsDisplay();
        
    }

    
    @objc func logout()
    {
        dismiss(animated: true, completion: nil)
    }



}

