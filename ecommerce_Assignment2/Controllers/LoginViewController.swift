//
//  LoginViewController.swift
//  Ecommerce
//
//  Created by May Derbas on 2020-07-14.
//  Copyright © 2020 May Derbas. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

   
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    // User Object Creation
    var users = [User]()
    
    var userEmail:String = ""
    
    @IBAction func loginButton(_ sender: UIButton) {
        users = CoreDataManager.fetchUser()
        var invalid = true
        var index = 0
        // check for empty fields
        if emailTextField.text == "" || passwordTextField.text == ""{
            errorLabel.text = "Email and Password are required"
        }else{
            // repeat until valid credential found or index equals users.count
            repeat{
                if (emailTextField.text == users[index].email && passwordTextField.text == users[index].password){
                    invalid = false
                    userEmail = users[index].email 
                }else {
                    index = index + 1
                }
            
            }while (invalid && index < users.count)
            if invalid == true {
                errorLabel.text = "Incorrect Email or Password"
            }else {
            // when valid credentials are met, go to navigation controller, and empty all fields
                errorLabel.text = ""
                emailTextField.text = ""
                passwordTextField.text = ""
                
                
               // go to navigation controller
                self.performSegue(withIdentifier: "goToNavigation", sender: self)
            }
    }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CoreDataManager.preloadCoreData()
        // TapGestureRecignizer for dismissing the keyboard
            let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
            view.addGestureRecognizer(tap)
        
        
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        
        errorLabel.text = " "
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nav = segue.destination as? UINavigationController
        let productTableController = nav?.viewControllers.first as! ProductTableViewController
        productTableController.userEmail = userEmail
    }
    
    // function to make the return key on the keyboard work
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            self.view.endEditing(true)
            return false
        }
    

}

