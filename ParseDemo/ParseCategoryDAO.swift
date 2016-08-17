//
//  ParseCategoryDAO.swift
//  ParseDemo
//
//  Created by Saumeel Gajera on 8/14/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit
import Parse

// use game score dao
class ParseCategoryDAO: NSObject {
    
    var className : String!
    
    init(className : String) {
        self.className = className
    }
    
    func saveCategory(pfObject: PFObject, completion: (Bool, NSError?) -> Void) -> Void {
        print("in save category of parsecategorydao")
        pfObject.saveInBackgroundWithBlock { (created: Bool, error: NSError?) in
            print("pfobject save in bg!")
            completion(created,error)
            print(pfObject)
        }
    }
    
    func getAllCategories(completion: ([PFObject]?, NSError?) -> Void) {
        let pfQuery = PFQuery(className: className)
        pfQuery.findObjectsInBackgroundWithBlock { (objects: [PFObject]?, error: NSError?) -> Void in
            completion(objects, error)
        }
    }
    
    func getCategoryById(id: String, completion: (PFObject?, NSError?) -> ()) {
        let pfQuery = PFQuery(className: className)
        pfQuery.getObjectInBackgroundWithId(id) { (pfObject: PFObject?, error: NSError?) in
            completion(pfObject, error)
        }
    }
    
    func deleteCategoryById(id: String, completion: (Bool, NSError?) -> ()) -> Void {
        getCategoryById(id) { (pfObject: PFObject?, error: NSError?) in
            if let pfObject = pfObject {
                pfObject.deleteInBackgroundWithBlock({ (deleted: Bool, error: NSError?) in
                    completion(deleted, error)
                })
            }
        }
    }
    
}
