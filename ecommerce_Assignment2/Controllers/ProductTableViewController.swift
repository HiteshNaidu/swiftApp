//
//  ProductTableViewController.swift
//  ecommerce_Assignment2
//
//  Created by May Derbas on 2020-07-16.
//  Copyright © 2020 May Derbas. All rights reserved.
//

import UIKit

class ProductTableViewController: UITableViewController {
   @IBOutlet weak var logoutOutlet: UIBarButtonItem!        //Mark: - Data Model
        
     var products = CoreDataManager.fetchProduct()
     var userEmail:String!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            title = " Online Store"
            tableView.rowHeight = UITableView.automaticDimension
            tableView.estimatedRowHeight = 500
            let logo = UIImage(named: "profile.png")
            print(logo)
            let imageView = UIImageView(image: logo)
            self.navigationItem.titleView = imageView
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ProductTableViewController.tap(_:)));
            self.navigationItem.titleView!.isUserInteractionEnabled = true;
            self.navigationItem.titleView!.addGestureRecognizer(tapRecognizer)
            }
    
    override var canBecomeFirstResponder : Bool {
        return true
    }
    
    @objc func tap(_ gestureRecognizer: UITapGestureRecognizer) {
        
        //fetching the screen coordiniates where users touched
        let point = gestureRecognizer.location(in: self.navigationItem.titleView)
        
        //Creating Menu object
        let menu = UIMenuController.shared
        //Creating menu items
        let showPro = UIMenuItem(title: "Profile",action: #selector(ProductTableViewController.showProfile))
    
        //Setting menu items to menu controllers
        menu.menuItems = [showPro]
        let rectObj:CGRect = CGRect(x:point.x, y:point.y ,width: 8,height: 7);
        print(rectObj)
        menu.showMenu(from:self.navigationItem.titleView!, rect: rectObj)
    }
    
    
    
    @objc func showProfile()
    {
      self.performSegue(withIdentifier: "profile", sender: self)
    }
    
        // table view data source
        // Number of section in Table View
        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        // Number of rows in each section
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return products.count    //number of products in section, here we have one section
        }
        
        // Set cell data
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
            
            let product = products[indexPath.row]      // a product in specific index
            cell.product = product                     // assign product to cell
            
            
            return cell
        }
        // Set section title, we have one section we called it Products
        override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            
            return " Products"
        }
        
    
    // when a row at indexPath is selected
        var selectedItem : Product?
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          let product = products[indexPath.row]
          selectedItem = product
          performSegue(withIdentifier: "showProductDetail", sender: nil)
        }
        //prepare for segue, navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // when there is more than one segue, we specify it by its identifier
            if segue.identifier == "showProductDetail" {
                let detailTableViewController = segue.destination as! DetailTableViewController
            // we assign the selected item to product in DetailTableViewController
                detailTableViewController.product = selectedItem
            }
            
            else if segue.identifier == "profile"
            {
                let profileViewController = segue.destination as! ProfileViewController
                profileViewController.userEmail = userEmail
                
                
            }
            
        }
        
   // logout and go back to first view
    @IBAction func logoutButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}
        
        
    
