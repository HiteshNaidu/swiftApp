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

        override func viewDidLoad() {
            title = "Product Detail"
            
            
            // set product to our imageview and labels,
            productImageView.image = product!.image
            productTitleLabel.text = product!.name
            productPriceLabel.text = " $ \(product!.price) "
            productDetailLabel.text = product!.details
            productImageView.isUserInteractionEnabled = true;
    
            
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(DetailTableViewController.tap(_:)));
                   //productImageView.isUserInteractionEnabled = true
                   productImageView.addGestureRecognizer(tapRecognizer)
        }
    
    override var canBecomeFirstResponder : Bool {
        return true
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
        
        //fetching the screen coordiniates where users touched
        let point = gestureRecognizer.location(in: productImageView)
        
        //Creating Menu object
        let menu = UIMenuController.shared
        tableView.bringSubviewToFront(productImageView)
        
        //Creating menu items
//        let logout = UIMenuItem(title: "Logout",action: #selector(DetailTableViewController.logout))
        let seeFullImage = UIMenuItem(title: "See Full Image", action: #selector(DetailTableViewController.showFullImage))
        
        //Setting menu items to menu controllers 
//        menu.menuItems = [logout,seeFullImage]
        menu.menuItems = [seeFullImage]
        let rectObj:CGRect = CGRect(x:point.x, y:point.y ,width: 10,height: 7);
        print(rectObj)
        menu.showMenu(from:productImageView, rect: rectObj)
    }
    
    @objc func logout()
    {
      dismiss(animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as? ViewFullImage
        controller!.myImage = product!.image
        
        
    }
    
    @objc func showFullImage()
    {
         self.performSegue(withIdentifier: "showImage", sender: self)
    }


}

