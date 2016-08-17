//
//  CategoryMapper.swift
//  ParseDemo
//
//  Created by Saumeel Gajera on 8/14/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit
import Parse

class CategoryMapper: NSObject {
    func toCatogory(pfObject: PFObject?) -> Category?{
        var categoryDictionary : Dictionary<String, AnyObject> = [:]
        if let pfObject = pfObject {
            categoryDictionary["name"] = pfObject.objectForKey("name") as! String
            categoryDictionary["owner"] = pfObject.objectForKey("owner") as! String
        }
        return Category(categoryDictionary: categoryDictionary)
    }
    
    func toPFObject(category: Category) -> PFObject{
        let categoryPFObject = PFObject(className: Constants.CATOEGORY_CLASSNAME)
        categoryPFObject["name"] = category.name
        categoryPFObject["owner"] = category.ownwerID
        
        return categoryPFObject
    }
    
    func toCategories(pfObjects : [PFObject]?) -> [Category] {
        var categories : [Category] = []
        if let pfObjects = pfObjects {
            for pfObject in pfObjects {
                print(pfObject)
                categories.append(toCatogory(pfObject)!)
            }
        }
        return categories
    }
}
