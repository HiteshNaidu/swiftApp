//
//  CoreDataManager.swift
//  ecommerce_Assignment2
//
//  Created by May Derbas on 2020-08-10.
//  Copyright © 2020 May Derbas. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {
    // this function is to get context, so we don't need to repeat all code in all pages
    private class func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    // save products to core data
    class func storeProduct(name: String, details: String, price: Double, image: String){
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Item", in: context)
        let managedObject = NSManagedObject(entity: entity!, insertInto: context)
        
        managedObject.setValue(name, forKey: "name")
        managedObject.setValue(details, forKey: "details")
        managedObject.setValue(price, forKey: "price")
        managedObject.setValue(image, forKey: "image")
        
        do{
            try context.save()
            print("product saved")
        } catch{
            print("error saving data")
        }
    }
    // this function is to fetch products ot items from core data
    class func fetchProduct() -> [Product]{
        var items = [Product]()
        
        let fetchRequest:NSFetchRequest<Item> = Item.fetchRequest()
        
        do{
            let fetchResult = try getContext().fetch(fetchRequest)
            
            for item in fetchResult {
                let product = Product(name: item.name!, details: item.details!, price: item.price, imageName: item.image!)
                items.append(product)
            }
        }catch{
            print("error")
        }
        return items
    }
    
    // this function is to fetch users from Customer entity
    class func fetchUser() -> [User]{
           var users = [User]()
           
           let fetchRequest:NSFetchRequest<Customer> = Customer.fetchRequest()
           
           do{
               let fetchResult = try getContext().fetch(fetchRequest)
               
               for item in fetchResult {
                   let user = User(email: item.email!, password: item.password!)
                   users.append(user)
               }
           }catch{
               print("error")
           }
           return users
       }
    
    class func saveUser(email: String, password: String){
        
            let context = getContext()
            let entity = NSEntityDescription.entity(forEntityName: "Customer", in: context)
            let managedObject = NSManagedObject(entity: entity!, insertInto: context)
            
            managedObject.setValue(email, forKey: "email")
            managedObject.setValue(password, forKey: "password")
            
            
            do{
                try context.save()
                print("user saved")
            } catch{
                print("error saving data")
            }
        }
        
   // this fuction is for seed data
   // it will fetch data from each entity, if entity is empty, it will use
  // seed data and save new data, but if it has data. it will keep it as is
    class func preloadCoreData(){
        let items = fetchProduct()             //fetch data from Item entity
        if (items.count == 0){
    storeProduct(name: "ROSE GOLD-TONE MESH ANALOG WATCH" , details:"Dial up the luxe factor in your every day look with an elegant timepiece. Featuring a rose gold-tone mesh band, a framed bezel and a white dial with analog movement." , price: 139.99, image:"image1")
    storeProduct(name: "ROSE GOLD-TONE SQUARE MESH WATCH" , details:"Upgrade your everyday watch with this square rose gold-tone timepiece featuring an analog design, crystal details and a self-adjustable mesh bracelet." , price: 149.99, image:"image2")
    storeProduct(name: "GOLD-TONE SPORT WATCH" , details:"Add a high-shine finish to your everyday style with this gold-tone watch. Includes day, date and 24 hour international time." , price: 149.99, image:"image3")
    storeProduct(name: "PETITE SILVER-TONE ANALOG WATCH" , details:"Perfect to match everyday ensembles, this delicate watch features a silver-tone case, analog face and mesh bracelet with G-link security." , price: 109.99, image:"image4")
    storeProduct(name: "BLACK SILICONE AND GOLD-TONE WATCH" , details:"Accent any look with this sharp timepiece. Features a black silicone strap, a silver-tone round bezel and a white dial complete with an analog movement." , price: 159.99, image:"image5")
    storeProduct(name: "SPARKLE WATCH BOX SET" , details:"With a strap for every occasion, this boxed watch set makes the perfect gift (especially for yourself). Includes a polished silver-tone watch with crystal bezel and white strap, plus interchangeable black and red leather straps." , price: 159.99, image:"image6")
    storeProduct(name: "ADRIANA MINI BACKPACK" , details:"Your new favorite bag. This faux-leather backpack features a zip front pocket, zip around closure, front logo emblem, adjustable straps, and a logo keychain with various charms." , price: 70.99, image:"handbag1")
    storeProduct(name: "SCHWARTS LOGO PRINTED SATCHEL" , details:"This roomy satchel features a logo printed faux-leather composition and a front logo detail. Designed with a logo charm and interior pockets for organization. Top zipper." , price: 74.99, image:"handbag2")
    storeProduct(name: "HADFIELD COLOR-BLOCK ZIP-AROUND WALLET" , details:"Faux-leather wallet featuring a color-block design adorned with a silver-tone logo. Divided interior designed with enough room for phone storage. Zip closure." , price: 49.99, image:"handbag3")
    storeProduct(name: "HASTINGS COLOR-BLOCK LOGO CROSSBODY" , details:"This classic crosshatched faux-leather crossbody bag features a color-blocked design, shiny silver-tone hardware and a script logo detail. Top zipper closure." , price: 70.99, image:"handbag4")
    storeProduct(name: "RODERICK CAMO NYLON WRISTLET" , details:"Keep only the essentials in this nylon wristlet designed with an allover camo print and GUESS logo emblem. Featuring an attached wristlet strap and interior pockets to keep things organized. Zip closure." , price: 39.99, image:"handbag5")
            storeProduct(name: "ALLOVER LOGO SOFT MINI BACKPACK" , details:"Soft mini backpack featuring an allover logo print. Designed with exterior zip pocket and included removable pom and wristlet keychain. Zip closure." , price: 59.99, image:"handbag6")
            
        }
        else {print("you have products data in Core Data")}
        
        let users = fetchUser()                 //fetch data from Customer entity
        if users.count == 0 {
           saveUser(email:"may@gmail.com",password: "may")
           saveUser(email:"aishwarya@gmail.com",password: "aishwarya")
           saveUser(email:"hitesh@gmail.com",password: "hitesh")
           saveUser(email:"shreyas@gmail.com",password: "shreyas")
            
        }else {print("you have users data in Core Data")}
       
    }
}
